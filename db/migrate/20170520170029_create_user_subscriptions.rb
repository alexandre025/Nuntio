class CreateUserSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :user_subscriptions do |t|
      t.references :subscription, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
