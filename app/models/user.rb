class User < ApplicationRecord
  has_secure_password
  has_many :collections

  def avatar
    'https://www.gravatar.com/avatar/' + Digest::MD5.hexdigest(email)
  end
end
