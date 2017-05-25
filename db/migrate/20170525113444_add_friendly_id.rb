class AddFriendlyId < ActiveRecord::Migration[5.1]
  def change
    add_column :towers, :slug, :string
    add_column :themes, :slug, :string
    add_column :categories, :slug, :string
  end
end
