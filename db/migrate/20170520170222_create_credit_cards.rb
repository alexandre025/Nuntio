class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.references :user, foreign_key: true
      t.integer :month
      t.integer :year
      t.integer :day
      t.integer :last_digits, limit: 4
      t.string :cc_type, limit: 45
      t.string :gateway_customer_profile_id, limit: 45
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
