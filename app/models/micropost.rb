class Micropost < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 140 }
  mount_uploader :photo, PhotoUploader

  has_many :likes, dependent: :destroy
  
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

end
