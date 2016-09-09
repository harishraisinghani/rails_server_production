class CreatePings < ActiveRecord::Migration[5.0]
  def change
    create_table :pings do |t|
      t.float :lat
      t.float :long
      t.references :checkin, foreign_key: true

      t.timestamps
    end
  end
end
