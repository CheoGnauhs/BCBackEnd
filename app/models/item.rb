class Item < ApplicationRecord
  has_many :comments
  has_many :collections
  belongs_to :user

  enum status: %i[active sold closed]
end
