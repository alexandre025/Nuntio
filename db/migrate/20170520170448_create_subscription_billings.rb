class CreateSubscriptionBillings < ActiveRecord::Migration[5.1]
  def change
    create_table :subscription_billings do |t|
      t.references :subscription, foreign_key: true
      t.references :billing, foreign_key: true
      t.timestamps
    end
  end
end
