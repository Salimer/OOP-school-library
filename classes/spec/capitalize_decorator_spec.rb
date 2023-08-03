require_relative './spec_helper'

describe Decorator do
    before :each do
        @capitalize_decorator = CapitalizeDecorator.new('Afghanistan')
    end

    context 'correct_name' do
        it 'Check if nameable exists' do
            expect(@capitalize_decorator.nameable).to eq 'Afghanistan'
        end
    end
end
