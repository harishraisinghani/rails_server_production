class CreateSkiers < ActiveRecord::Migration[5.0]
  def change
    create_table :skiers do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password_digest
      t.string :ec1
      t.string :ec1phone
      t.string :ec2
      t.string :ec2phone
      t.integer :current_checkin_id
      t.string :username
      t.string :profile_picture
      t.string :phone

      t.timestamps
    end
  end
end
