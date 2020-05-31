class AddScheduleDateToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :schedule_date, :datetime , :null => true
  end
end
