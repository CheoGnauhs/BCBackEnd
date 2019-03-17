class Item < ApplicationRecord
  has_many :comments
  has_many :collections
  has_and_belongs_to_many :tags
  belongs_to :seller, class_name: 'User'
  has_one_attached :cover

  enum status: %i[active sold closed]
  enum field: %i[book stationary supplies]
  enum method: %i[online offline]
end
