class CreateCheckins < ActiveRecord::Migration[5.0]
  def change
    create_table :checkins do |t|
      t.datetime :checkout
      t.references :destination, foreign_key: true
      t.references :skier, foreign_key: true

      t.timestamps
    end
  end
end
