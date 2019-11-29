class Chat < ApplicationRecord
  belongs_to :application

  has_many :messages
  validates_presence_of :number
end
