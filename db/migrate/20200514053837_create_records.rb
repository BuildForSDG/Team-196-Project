class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.integer :specialist_id
      t.text :description
      t.string :diagnosis
      t.string :boolean
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end


