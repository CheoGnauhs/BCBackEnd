class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item

  enum status: %i[active finished cancelled]
end
