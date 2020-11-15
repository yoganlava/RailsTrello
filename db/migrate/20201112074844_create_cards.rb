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
  end
end
