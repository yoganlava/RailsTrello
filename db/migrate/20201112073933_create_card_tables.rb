class CreateCardTables < ActiveRecord::Migration[5.2]
  def change
    create_table :card_tables do |t|
      t.integer :board_id
      t.integer :column_index
      t.string :name

      t.timestamps
    end

    add_foreign_key :card_tables, :boards, column: :board_id, on_delete: :cascade
    change_column_null :card_tables, :board_id, false
    change_column_null :card_tables, :column_index, false
    change_column_null :card_tables, :name, false
  end
end
