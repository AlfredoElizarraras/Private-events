class AddCreatorToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :creator_id, :integer, null: false
  end
end
