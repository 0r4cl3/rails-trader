class CreateGranularities < ActiveRecord::Migration
  def change
    create_table :granularities do |t|
      t.string :granularity

      t.timestamps null: false
    end
  end
end
