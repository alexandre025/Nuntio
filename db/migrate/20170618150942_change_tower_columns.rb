class ChangeTowerColumns < ActiveRecord::Migration[5.1]
  def change
    change_column :towers, :short_excerpt, :string, limit: 255, null: true
    change_column :tower_guards, :excerpt, :text, null: true
  end
end
