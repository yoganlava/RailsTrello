class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :user do |t|
      t.string :email
      t.boolean :verified
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
