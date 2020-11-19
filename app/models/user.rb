class User < ApplicationRecord
  has_secure_password

  def self.from_token_payload(payload)
    self.find payload["sub"]
  end
end
