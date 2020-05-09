class CreateAttendance < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.references :attendee, null: false, index: true, foreign_key: { to_table: :users }
      t.references :attended_event, null: false, index: true, foreign_key: { to_table: :events }
    end
  end
end
