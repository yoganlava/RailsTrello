class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :name
      t.integer :creator
      t.string :color
      t.string :image
      t.boolean :private
      t.string :custom_url

      t.timestamps
    end

    add_index :boards, :custom_url, unique: true
    add_index :boards, [:name, :creator], unique: true

  end
end
