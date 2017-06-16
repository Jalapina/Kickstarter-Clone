class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :backers
end
