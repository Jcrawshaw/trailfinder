class Trail < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  has_many :favorites, dependent: :destroy
  mount_uploader :images, ImagesUploader

  geocoded_by :address
  after_validation :geocode
end
