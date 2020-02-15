class AddPhotoToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :photo, :string
  end
end
