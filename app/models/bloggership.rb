class Bloggership < ActiveRecord::Base
  belongs_to :blog
  belongs_to :user

  validates_associated :user
  validates_associated :user
end
