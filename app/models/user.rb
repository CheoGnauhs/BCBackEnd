class User < ApplicationRecord
  has_secure_password
  has_many :collections
  has_many :items, foreign_key: 'seller_id'
  has_many :orders, foreign_key: 'buyer_id'

  def avatar
    Digest::MD5.hexdigest(email)
  end
end
