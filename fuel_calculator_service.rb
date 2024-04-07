# NASA mission fuel calculation

# frozen_string_literal: true

class FuelCalculatorService
  attr_reader :equipment_weight

  PLANET_GRAVITIES = {
    'Earth' => 9.807,
    'Moon' => 1.62,
    'Mars' => 3.711
  }.freeze

  COEFFICIENTS = {
    launch: { multiplier: 0.042, subtractor: 33 },
    land: { multiplier: 0.033, subtractor: 42 }
  }.freeze

  def initialize(equipment_weight, path)
    @equipment_weight = equipment_weight
    @path = path
  end

  def call
    @weight_fuel = calculate_total_fuel(@equipment_weight, @path, fuel_empty: true)
    calculate_total_fuel(@weight_fuel + @equipment_weight, @path)
  end

  private

  def calculate_total_fuel(equipment, path, fuel_empty: false)
    total_fuel = 0
    @equipment_weight = equipment

    path.each do |action, planet|
      gravity = PLANET_GRAVITIES[planet]
      leg_fuel = calculate_fuel(equipment_weight, gravity, action)
      total_fuel += leg_fuel
      @equipment_weight = recalculate_equipment_weight(equipment_weight, leg_fuel, gravity, action, fuel_empty)
    end
    total_fuel
  end

  def recalculate_equipment_weight(equipment_weight, leg_fuel, gravity, action, fuel_empty)
    return equipment_weight + leg_fuel if fuel_empty

    equipment_weight - leg_fuel - calculate_fuel(leg_fuel, gravity, action)
  end

  def calculate_fuel(mass, gravity, action)
    coefficients = COEFFICIENTS[action]
    (mass * gravity * coefficients[:multiplier] - coefficients[:subtractor]).to_i
  end
end
