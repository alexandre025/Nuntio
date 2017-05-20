class CreateTowers < ActiveRecord::Migration[5.1]
  def change
    create_table :towers do |t|
      t.string :title, limit: 255, null: false
      t.text :description, null: false
      t.string :locales, array: true
      t.monetize :price_per_month, null: false
      t.string :frequency, limit: 45, null: false
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
