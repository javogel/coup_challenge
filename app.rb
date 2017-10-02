#!/usr/local/bin/ruby
require 'sinatra/base'
require 'json'
require './lib/fleet_optimizer'
require 'pry'

class CoupApp < Sinatra::Base

  before do
    request.body.rewind
    @parsed_request = JSON.parse(request.body.read, symbolize_names: true)
  end

  post '/scooters' do
    content_type :json
    engineers_needed = optimizer.call(**@parsed_request)
    { fleet_engineers: engineers_needed }.to_json
  end

  private

  def optimizer
    @optimizer ||= FleetOptimizer.new
  end

end
