# frozen_string_literal: true

class Hospital < ApplicationRecord
  validates :state, length: { is: 2 }
end
