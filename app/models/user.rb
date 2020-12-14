class User < ApplicationRecord
  has_secure_password

  has_many :boards

  def self.from_token_payload(payload)
    self.find payload["sub"]
  end
end
