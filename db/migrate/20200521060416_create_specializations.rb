# frozen_string_literal: true

class CreateSpecializations < ActiveRecord::Migration[6.0]
  def change
    create_table :specializations do |t|
      t.integer :specialization_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
