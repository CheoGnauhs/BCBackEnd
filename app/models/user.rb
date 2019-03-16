class User < ApplicationRecord
  has_secure_password

  def avatar
    'https://www.gravatar.com/avatar/' + Digest::MD5.hexdigest(email)
  end
end
