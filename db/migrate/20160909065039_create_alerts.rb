class CreateAlerts < ActiveRecord::Migration[5.0]
  def change
    create_table :alerts do |t|
      t.boolean :false_alarm
      t.boolean :user_generated
      t.string :state
      t.references :dispatcher, foreign_key: true
      t.references :patroller, foreign_key: true
      t.references :ping, foreign_key: true

      t.timestamps
    end
  end
end
