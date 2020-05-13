class AddFieldsToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :title, :string, null: false
    add_column :events, :location, :string
    add_column :events, :accesibility, :boolean, null: false, default: true
  end
end
