class Trail < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  has_many :favorites, dependent: :destroy
  mount_uploader :images, ImagesUploader

  geocoded_by :address
  after_validation :geocode

  def self.search(search)
    where("state LIKE ?", "%#{search}%")
    # where("title LIKE ?", "%#{search}%")
    # where("address LIKE ?", "%#{search}%")
  end

end
