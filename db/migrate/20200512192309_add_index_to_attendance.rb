class AddIndexToAttendance < ActiveRecord::Migration[6.0]
  def change
    add_index :attendances, [:attendee_id, :attended_event_id], :unique => true
  end
end
