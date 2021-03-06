class Item < ApplicationRecord
  has_many :comments
  has_many :collections
  has_and_belongs_to_many :tags, join_table: :tags_items
  belongs_to :seller, class_name: 'User'
  has_one_attached :cover

  enum status: %i[active sold closed]
  enum field: %i[book stationary supplies]
  enum method: %i[online offline]

  def set_tags(gtags)
    self.tags.clear
    gtags.uniq.each do |tag|
      itag = Tag.find_by_name(tag)
      if itag.blank?
        itag = Tag.create!(name: tag)
      end
      self.tags << itag
    end
    self.save
  end
end
