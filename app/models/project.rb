class Project < ActiveRecord::Base
  belongs_to :user
  has_one :story, dependent: :destroy
  has_many :rewards, dependent: :destroy
  mount_uploader :image, ImageUploader
end
