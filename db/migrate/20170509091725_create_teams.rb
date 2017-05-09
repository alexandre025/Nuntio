class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name, limit: 45, null: false
      t.string :code, limit: 45, null: false
      t.timestamps
    end
  end
end
