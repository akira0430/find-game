class AddDetailsToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :details, :text
  end
end
