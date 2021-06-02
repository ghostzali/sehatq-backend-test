class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :code
      t.integer :queue_number
      t.date :queue_date
      t.references :schedule
      t.references :user
      t.index :code, unique: true
      t.timestamps
    end
  end
end
