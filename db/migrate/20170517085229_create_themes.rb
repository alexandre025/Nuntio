class CreateThemes < ActiveRecord::Migration[5.1]
  def change
    create_table :themes do |t|
      t.string :name, limit: 45, null: false
      t.timestamps
    end
  end
end
