class AddTowersMissingFields < ActiveRecord::Migration[5.1]
  def change
    add_column :towers, :excerpt, :text, null: false
    add_column :towers, :short_excerpt, :string, limit: 255

    add_column :tower_guards, :excerpt, :text
    add_column :tower_guards, :short_excerpt, :string, limit: 255, null: false
  end
end
