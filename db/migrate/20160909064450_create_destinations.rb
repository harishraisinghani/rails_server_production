class CreateDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.float :radius

      t.timestamps
    end
  end
end
