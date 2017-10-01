#!/usr/local/bin/ruby
require 'sinatra'
require 'json'
require './lib/fleet_optimizer'
# require 'pry'

OPTIMIZER = FleetOptimizer.new

post '/scooters' do
  content_type :json

  request_body = request.body.string
  parsed_request = JSON.parse(request_body, symbolize_names: true)
  engineers_needed = OPTIMIZER.call(**parsed_request)

  { fleet_engineers: engineers_needed }.to_json
end
