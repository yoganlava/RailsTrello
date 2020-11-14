class CreateBoard < ActiveRecord::Migration[5.2]
  def change
    create_table :board do |t|
      t.string :name
      t.integer :creator
      t.boolean :private
      t.string :custom_url

      t.timestamps
    end
  end
end
