require_relative './spec_helper'

describe Decorator do
    before :each do
        @decorator = Decorator.new('Afghanistan')
    end

    context 'correct_name' do
        it 'Check if nameable exists' do
            expect(@decorator.nameable).to eq 'Afghanistan'
        end
    end
end
