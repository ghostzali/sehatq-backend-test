class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.string :code
      t.string :name
      t.references :specialty, null: true, foreign_key: true
      t.index :code, unique: true
      t.timestamps
    end
  end
end
