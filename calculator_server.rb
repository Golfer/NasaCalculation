require './fuel_calculator_service.rb'

puts "Enter the weight of equipment (kg):"
equipment_weight = gets.chomp.to_i

puts "Enter the path (format: [[:launch, 'Earth'], [:land, 'Moon']]"
plain_path = eval(gets.chomp)

total_fuel_required = FuelCalculatorService.new(equipment_weight, plain_path).call

# Result
puts "Total fuel required: #{total_fuel_required} KG of Fuel"
