class Post < ActiveRecord::Base
  belongs_to :trail
  belongs_to :user
  has_many :comments
end
