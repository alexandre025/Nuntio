class AddTowerFeatured < ActiveRecord::Migration[5.1]
  def change
    add_column :towers, :is_featured, :boolean, default: :false
  end
end
