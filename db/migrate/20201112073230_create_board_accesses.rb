class CreateBoardAccesses < ActiveRecord::Migration[5.2]
  def change
    create_table :board_accesses do |t|
      t.integer :user_id
      t.integer :board_id

      t.timestamps
    end

    add_index :board_accesses, [:user_id, :board_id], unique: true

    change_column_null :board_accesses, :user_id, false
    change_column_null :board_accesses, :board_id, false
  end
end
