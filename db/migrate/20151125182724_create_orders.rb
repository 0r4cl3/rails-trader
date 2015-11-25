class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :trade_id, limit: 8

      t.timestamps null: false
    end
  end
end
