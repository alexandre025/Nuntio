class ChangeTowerShotExcerptColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :towers, :short_excerpt, :string, limit: 255, null: true
  end
end
