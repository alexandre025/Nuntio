class CreateBillings < ActiveRecord::Migration[5.1]
  def change
    create_table :billings do |t|
      t.monetize :amount
      t.datetime :begin_at
      t.datetime :end_at
      t.string :gateway_payment_profile_id, limit: 255
      t.timestamps
    end
  end
end
