# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Hospital, type: :model do
  subject(:hospital) do
    Hospital.create(
      name: 'Foo',
      city: 'Chicago',
      state: 'IL',
      address: '101 North Main Street',
      phone_number: '8885551212'
    )
  end

  context '#state' do
    it 'is more than two characters' do
      hospital.state = 'AAAA'
      expect(hospital).not_to be_valid
    end

    it 'is exactly two characters' do
      expect(hospital).to be_valid
    end
  end

  context '#phone_number' do
    it 'is more than 10 characters' do
      hospital.phone_number = 'X' * 20
      expect(hospital).not_to be_valid
    end

    it 'is exactly ten characters' do
      hospital.phone_number = 'X' * 10
      expect(hospital).to be_valid
    end

    it 'is required' do
      hospital.phone_number = nil
      expect(hospital).not_to be_valid
    end
  end
end
