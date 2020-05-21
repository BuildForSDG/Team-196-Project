class CreateSpecialistMappers < ActiveRecord::Migration[6.0]
  def change
    create_table :specialist_mappers do |t|
      t.integer :specialist_id
      t.integer :specialization_id

      t.timestamps 
    end
  end
end
