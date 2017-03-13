class Photo < ActiveRecord::Base
  belongs_to :picture
  mount_uploader :image, ImageUploader
end
