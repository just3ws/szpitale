# frozen_string_literal: true

class Hospital < ApplicationRecord
  validates :state, length: { is: 2 }
  validates :phone_number, presence: true, length: { maximum: 10 }
end
