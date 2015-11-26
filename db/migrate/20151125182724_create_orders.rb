class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :trade_id, limit: 8
      t.string :instrument
      t.string :side
      t.integer :units, limit: 8

      t.timestamps null: false
    end
  end
end
