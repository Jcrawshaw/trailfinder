class Trail < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  mount_uploader :images, ImagesUploader

  geocoded_by :address
  after_validation :geocode
end
