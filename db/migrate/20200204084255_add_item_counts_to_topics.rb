class AddItemCountsToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :item_counts, :integer
  end
end
