class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.references :card_table, foreign_key: {on_delete: :cascade}
      t.string :name
      t.boolean :completed
      t.text :description
      t.integer :priority
      t.datetime :due_date

      t.timestamps
    end

    change_column_null :cards, :card_table_id, false
    change_column_null :cards, :name, false
    change_column_null :cards, :completed, false
    change_column_null :cards, :priority, false
    change_column_null :cards, :due_date, false
  end
end
