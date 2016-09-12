class AddTokenToPatrollers < ActiveRecord::Migration[5.0]
  def change
    add_column :patrollers, :token, :string
  end
end
