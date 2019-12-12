class Article < ApplicationRecord
  has_many :codes
  has_many :urls
  has_many :comments
  acts_as_taggable

  validates :title, presence: true
  validates :solution, presence: true
  validates :user_id, presence: true
end
