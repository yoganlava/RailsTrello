class CreateCardTables < ActiveRecord::Migration[5.2]
  def change
    create_table :card_tables do |t|
      t.references :board, foreign_key: {on_delete: :cascade}
      t.integer :column_index
      t.string :name

      t.timestamps
    end

    change_column_null :card_tables, :board_id, false
    change_column_null :card_tables, :column_index, false
    change_column_null :card_tables, :name, false
  end
end
