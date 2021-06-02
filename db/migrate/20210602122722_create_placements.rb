class CreatePlacements < ActiveRecord::Migration[6.1]
  def change
    create_table :placements do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :hospital, null: false, foreign_key: true
      t.timestamps
    end
  end
end
