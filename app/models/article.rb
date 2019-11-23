class Article < ApplicationRecord
  has_many :codes
  has_many :urls
  has_many :comments

  validates :title, presence: true
  validates :solution, presence: true

end
