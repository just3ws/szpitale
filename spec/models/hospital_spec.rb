# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Hospital, type: :model do
  context '#state' do
    it 'is more than two characters' do
      expect(Hospital.new(state: 'ABC')).not_to be_valid
    end

    it 'is exactly two characters' do
      expect(Hospital.new(state: 'AC')).to be_valid
    end
  end
end
