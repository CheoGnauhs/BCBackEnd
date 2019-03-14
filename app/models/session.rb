class Session < ApplicationRecord
  belongs_to :user

  TOKEN_DEFAULT_EXPIRY = 3.days

  def self.login(user, ip)
    token = SecureRandom.uuid.tr('-', '')
    self.create(token: token, expire_at: TOKEN_DEFAULT_EXPIRY.from_now,
                user: user, ip: ip)
  end
end
