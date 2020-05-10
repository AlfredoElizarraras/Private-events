class AddDateToAttendances < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :register_date, :date
  end
end
