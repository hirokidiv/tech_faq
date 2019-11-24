class Article < ApplicationRecord
  has_many :codes
  has_many :urls
  has_many :comments
  acts_as_taggable
  acts_as_taggable_on :skills, :interests
  validates :title, presence: true
  validates :solution, presence: true

end
