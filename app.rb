# frozen_string_literal: true

require './fuel_calculator_service'

puts "1) Apollo 11 mission: \n"
apollo_mission =
  FuelCalculatorService.new(
    28_801,
    [[:launch, 'Earth'], [:land, 'Moon'], [:launch, 'Moon'], [:land, 'Earth']]
  )
puts "Total fuel required for Apollo 11 mission: #{apollo_mission.call} KG of Fuel"
puts "\n"

puts " 2) Mars mission: \n"
mars_mission =
  FuelCalculatorService.new(
    14_606,
    [[:launch, 'Earth'], [:land, 'Mars'], [:launch, 'Mars'], [:land, 'Earth']]
  )
puts "Total fuel required for Mars mission: #{mars_mission.call} KG of Fuel"
puts "\n"

puts "3) Passenger ship: \n"
passenger_mission =
  FuelCalculatorService.new(
    75_432,
    [[:launch, 'Earth'], [:land, 'Moon'], [:launch, 'Moon'], [:land, 'Mars'], [:launch, 'Mars'], [:land, 'Earth']]
  )
puts "Total fuel required for Passenger ship: #{passenger_mission.call} KG of Fuel"
puts "\n"
