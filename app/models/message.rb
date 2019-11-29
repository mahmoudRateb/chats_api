class Message < ApplicationRecord
  belongs_to :chat

  validates_presence_of :msg_number
end
