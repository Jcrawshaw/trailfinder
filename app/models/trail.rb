class Trail < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  has_many :favorites, dependent: :destroy
  mount_uploader :images, ImagesUploader

  default_scope { order('state ASC') }

  geocoded_by :address
  after_validation :geocode

  def self.search(search)
    where("state LIKE ? OR title LIKE ? OR address LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%")
  end

end
