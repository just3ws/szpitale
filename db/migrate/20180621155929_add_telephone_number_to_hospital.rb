# frozen_string_literal: true

class AddTelephoneNumberToHospital < ActiveRecord::Migration[5.2]
  def change
    add_column :hospitals, :phone_number, :string
  end
end
