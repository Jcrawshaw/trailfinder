class Trail < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  has_many :favorites, dependent: :destroy
  mount_uploader :images, ImagesUploader

  default_scope { order('state ASC') }

  geocoded_by :address
  after_validation :geocode

  def self.search(search)
    where("LOWER(state) LIKE ? OR LOWER(title) LIKE ? OR LOWER(address) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%")
  end

  # db: "Florida"
  # search: "florida"

  # 1. "normalize" the db value (before_save name.downcase)
  #     where ( state: search.downcase )
  # 2. ILIKE - case-independent search 
  #       Sqlite vs Postgres
  

end
