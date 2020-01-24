class CreateInverterRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :inverter_records do |t|
      t.integer  :energy, default: 0
      t.datetime :produced_at, null: false
      t.integer  :inverter_id, null: false

      t.timestamps
    end
  end
end
