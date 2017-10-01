# frozen_string_literal: true

#Calculates minimum number of fleet engineers needed
class FleetOptimizer

  def call(**args)
    minimum_engineers_needed(scooters: args[:scooters],
                             manager_capacity: args[:C],
                             engineer_capacity: args[:P])
  end

  def minimum_engineers_needed(**args)
    sorted_districts = districts_sorted_by_need(**args)
    manager_district = sorted_districts.shift
    calculate_engineers_needed(dist_w_manager: manager_district,
                               dist_wo_manager: sorted_districts)
  end

  def calculate_engineers_needed(dist_w_manager:, dist_wo_manager:)
    sum_engineers_needed(type: :with_manager, source: dist_w_manager) +
    sum_engineers_needed(type: :without_manager, source: dist_wo_manager)
  end

  def districts_sorted_by_need(**args)
    district_stats = calculate_district_needs(**args)
    sort_descending_by(key: :benefit_of_having_manager,
                       data: district_stats)
  end

  def calculate_district_needs(scooters:, **args)
    scooters.map do |s|
      manager_present = engineers_needed_with_manager(scooters: s, **args)
      without_manager = engineers_needed(scooters: s, **args)
      district_hash(scooters: s,
                    manager_present: manager_present,
                    without_manager: without_manager)
    end
  end

  def district_hash(scooters:, manager_present:, without_manager: )
    {
      scooters: scooters,
      with_manager: manager_present,
      without_manager: without_manager,
      benefit_of_having_manager: without_manager - manager_present
    }
  end

  def sort_descending_by(key:, data:)
    data.sort{|a, b| b[key]<=>a[key]}
  end

  def sum_engineers_needed(type: , source:)
    return source[type] if source.is_a? Hash
    source.map{|x| x[type]}.inject(&:+)
  end

  def engineers_needed_with_manager(scooters:, manager_capacity:, **args)
      remainder = scooters - manager_capacity
      return 0 if remainder <= 0
      engineers_needed(scooters: remainder, **args)
  end

  def engineers_needed(scooters:, engineer_capacity:, **)
     (scooters.to_f / engineer_capacity).ceil
  end

end
