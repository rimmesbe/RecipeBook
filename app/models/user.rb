class User < ActiveRecord::Base
  has_secure_password
  has_many :recipes

  validates :name, uniqueness: true
end
