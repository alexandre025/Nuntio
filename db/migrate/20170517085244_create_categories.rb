class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name, limit: 45, null: false
      t.references :theme, foreign_key: true, null: false
      t.timestamps
    end
  end
end
