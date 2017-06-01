class ReworkOnCheckout < ActiveRecord::Migration[5.1]
  def change
    rename_column :subscriptions, :recurrence, :commitment
    add_column :subscriptions, :confirmed_at, :datetime
    add_column :subscriptions, :quantity, :integer
  end
end
