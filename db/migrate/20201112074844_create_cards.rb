class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :parent_id
      t.string :name
      t.boolean :completed
      t.text :description
      t.integer :priority
      t.datetime :due_date

      t.timestamps
    end

    add_foreign_key :cards, :card_tables, column: :parent_id, on_delete: :cascade
    change_column_null :cards, :parent_id, false
    change_column_null :cards, :name, false
    change_column_null :cards, :completed, false
    change_column_null :cards, :priority, false
    change_column_null :cards, :due_date, false
  end
end
