class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.references :user
      t.string :title
      t.string :address
      t.integer :price
      t.string :game
      t.string :photo

      t.timestamps
    end
  end
end
