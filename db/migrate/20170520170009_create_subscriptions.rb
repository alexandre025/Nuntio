class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.references :tower, foreign_key: true
      t.monetize :amount
      t.string :recurrence
      t.datetime :canceled_at
      t.datetime :deleted_at
      t.timestamps
    end
    add_reference :subscriptions, :owner, references: :users, index: true
    add_foreign_key :subscriptions, :users, column: :owner_id
  end
end
