class CreateCardTables < ActiveRecord::Migration[5.2]
  def change
    create_table :card_tables do |t|
      t.integer :board_id
      t.integer :column_index
      t.string :name

      t.timestamps
    end
  end
end
