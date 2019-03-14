class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many :replies, foreign_key: 'thread_id'
  belongs_to :thread, class_name: 'Comment'
end
