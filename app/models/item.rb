class Item < ApplicationRecord
  has_many :comments
  has_many :collections
  has_and_belongs_to_many :tags
  belongs_to :user

  enum status: %i[active sold closed]
end
