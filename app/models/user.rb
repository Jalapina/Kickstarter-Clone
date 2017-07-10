class User < ActiveRecord::Base
  has_secure_password 
  has_one  :pictures, as: :imageable
  has_many :projects, dependent: :destroy
  has_many :followings, class_name: 'Follow', :foreign_key => 'user_id'
  has_many :followers , through: :followings

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, presence: true, length: { in: 1..30 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  # validates :bio, length: { minimum: 5}
  before_validation :downcase_email

  def downcase_email
    self.email.downcase!
  end

end
