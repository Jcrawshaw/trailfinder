class Trail < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  has_many :favorites, dependent: :destroy
  mount_uploader :images, ImagesUploader

  geocoded_by :address
  after_validation :geocode

  def self.search(search)
    where("state LIKE ? OR title LIKE ? OR address LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end

end
