class User < ApplicationRecord
  validates_uniqueness_of :email

  has_many :links
end
