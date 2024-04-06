require 'rspec'
require_relative './fuel_calculator_service'
RSpec.describe FuelCalculatorService do
  describe '#call' do
    context 'with valid input' do
      it 'calculates the total fuel mission: Apollo 11' do
        equipment_weight = 28801
        path = [[:launch, 'Earth'], [:land, 'Moon'], [:launch, 'Moon'], [:land, 'Earth']]
        service = FuelCalculatorService.new(equipment_weight, path)
        total_fuel_required = service.call
        expect(total_fuel_required).to eq(51898) # Expected total fuel required
      end

      it 'calculates the total fuel mission: Mars' do
        equipment_weight = 14606
        path = [[:launch, 'Earth'], [:land, 'Mars'], [:launch, 'Mars'], [:land, 'Earth']]
        service = FuelCalculatorService.new(equipment_weight, path)
        total_fuel_required = service.call
        expect(total_fuel_required).to eq(33388) # Expected total fuel required
      end

      it 'calculates the total fuel mission: Passenger ship' do
        equipment_weight = 75432
        path = [[:launch, 'Earth'], [:land, 'Moon'], [:launch, 'Moon'], [:land, 'Mars'],[:launch, 'Mars'], [:land, 'Earth']]
        service = FuelCalculatorService.new(equipment_weight, path)
        total_fuel_required = service.call
        expect(total_fuel_required).to eq(212161) # Expected total fuel required
      end
    end
  end
end


# Run test
# rspec fuel_calculator_service_rspec.rb