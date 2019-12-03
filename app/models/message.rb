require 'elasticsearch/model'

class Message < ApplicationRecord
  belongs_to :chat

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings do
    mappings dynamic: false do
      indexes :chat_id, type: :integer
      indexes :content, type: :text, analyzer: :english
    end
  end

  validates_presence_of :msg_number

  def self.search_in_chat(query, chat_id)
    self.search({
                  query: {
                    bool: {
                      must: [
                        {
                          multi_match: {
                            query: query,
                            fields: [:content]
                          }
                        },
                        {
                          term: {
                            chat_id: chat_id
                          }
                      }]
                    }
                  }
    })
  end

end
