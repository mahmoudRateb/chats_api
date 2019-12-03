require 'elasticsearch/model'

class Message < ApplicationRecord
  belongs_to :chat

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  validates_presence_of :msg_number
end
