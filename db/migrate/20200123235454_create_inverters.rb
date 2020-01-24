class CreateInverters < ActiveRecord::Migration[5.1]
  def change
    create_table :inverters do |t|
      t.string :ref, null: false

      t.timestamps
    end
  end
end
