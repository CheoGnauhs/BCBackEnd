class User < ApplicationRecord
  has_secure_password
  has_many :collections
  has_many :items, foreign_key: 'seller_id'

  def avatar
    'https://www.gravatar.com/avatar/' + Digest::MD5.hexdigest(email)
  end
end
