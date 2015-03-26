class Post < ActiveRecord::Base
  belongs_to :trail
  belongs_to :user
  has_many :comments
  has_many :post_attachments
  accepts_nested_attributes_for :post_attachments
end
