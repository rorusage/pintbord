class Picture < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  belongs_to :owner, class_name: "User", foreign_key: :user_id

  validates :image, presence: true
  mount_uploader :image, ImageUploader

end
