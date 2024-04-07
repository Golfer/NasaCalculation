# frozen_string_literal: true

require 'rspec'
require_relative './fuel_calculator_service'
RSpec.describe FuelCalculatorService do
  subject { described_class.new(equipment_weight, path) }
  describe '#call' do
    context 'calculates the total fuel mission:' do
      context 'Apollo 11' do
        let(:equipment_weight) { 28_801 }
        let(:path) { [[:launch, 'Earth'], [:land, 'Moon'], [:launch, 'Moon'], [:land, 'Earth']] }
        it { expect(subject.call).to eq(51_898) }
      end
      context 'Mars' do
        let(:equipment_weight) { 14_606 }
        let(:path) { [[:launch, 'Earth'], [:land, 'Mars'], [:launch, 'Mars'], [:land, 'Earth']] }
        it { expect(subject.call).to eq(33_388) }
      end
      context 'Passenger ship' do
        let(:equipment_weight) { 75_432 }
        let(:path) do
          [[:launch, 'Earth'], [:land, 'Moon'], [:launch, 'Moon'], [:land, 'Mars'], [:launch, 'Mars'], [:land, 'Earth']]
        end
        it { expect(subject.call).to eq(212_161) }
      end
    end
  end
end
