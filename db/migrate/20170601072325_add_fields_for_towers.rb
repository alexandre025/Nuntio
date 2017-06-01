class AddFieldsForTowers < ActiveRecord::Migration[5.1]
  def change
    add_column :towers, :grade, :string

    add_column :users, :firstname, :string, limit: 45
    add_column :users, :lastname, :string, limit: 45

    Tower.update_all(grade: Tower::GRADES.first)

    change_column :towers, :grade, :string, null: false, limit: 45
  end
end
