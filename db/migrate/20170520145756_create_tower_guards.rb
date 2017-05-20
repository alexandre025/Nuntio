class CreateTowerGuards < ActiveRecord::Migration[5.1]
  def change
    create_table :tower_guards do |t|
      t.references :tower, foreign_key: true
      t.string :roles, array: true
      t.text :description
      t.timestamps
    end
    add_reference :tower_guards, :guard, references: :users, index: true
    add_foreign_key :tower_guards, :users, column: :guard_id
  end
end
