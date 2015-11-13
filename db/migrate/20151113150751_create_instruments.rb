class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.string :instrument
      t.string :displayName
      t.float :pip
      t.integer :maxTradeUnits

      t.timestamps null: false
    end
  end
end
