class Order < ApplicationRecord
  belongs_to :user, foreign_key: 'buyer_id'
  belongs_to :item

  enum status: %i[active finished cancelled]
end
