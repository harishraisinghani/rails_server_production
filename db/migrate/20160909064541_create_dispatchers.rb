class CreateDispatchers < ActiveRecord::Migration[5.0]
  def change
    create_table :dispatchers do |t|
      t.string :firstname
      t.string :lastname
      t.string :username
      t.string :password_digest
      t.boolean :on_shift
      t.references :destination, foreign_key: true

      t.timestamps
    end
  end
end
