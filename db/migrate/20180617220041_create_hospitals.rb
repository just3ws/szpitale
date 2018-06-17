# frozen_string_literal: true

class CreateHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :address

      t.timestamps
    end
  end
end
