class Application < ApplicationRecord

  validates :name, presence: true, length: { maximum: 50 }
  has_many :chats
  
  def Application.new_token
    SecureRandom.urlsafe_base64
  end

  def create_token
    update_attribute(:token, Application.new_token)
  end
end
