class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.references :tower_guard, foreign_key: true
      t.references :tower, foreign_key: true
      t.string :title, null: false
      t.text :excerpt
      t.text :content, null: false
      t.timestamps
    end
  end
end
