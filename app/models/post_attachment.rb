class PostAttachment < ActiveRecord::Base

  mount_uploader :gallery, GalleryUploader
  belongs_to :post
end
