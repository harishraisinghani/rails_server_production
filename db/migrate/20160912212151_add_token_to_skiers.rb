class AddTokenToSkiers < ActiveRecord::Migration[5.0]
  def change
    add_column :skiers, :token, :string
  end
end
