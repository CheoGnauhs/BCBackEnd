class Tag < ApplicationRecord
  has_and_belongs_to_many :items, join_table: :tags_items
end
