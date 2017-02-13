class Link < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title
  validates_presence_of :url
  validates_uniqueness_of :url
  validates :url, format: { with: URI.regexp }
end
