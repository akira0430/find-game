class Topic < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user

  validates :title, length: { maximum: 50 }, presence: true
  validates :address, presence: true
  validates :price, numericality: { only_integer: true }
  validates :game, presence: true
  validates :item_counts, numericality: { only_integer: true }
  validates :details, length: { maximum: 300 }
  validates :photo, presence: true
end
