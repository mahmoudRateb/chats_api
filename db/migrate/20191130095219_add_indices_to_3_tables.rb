class AddIndicesTo3Tables < ActiveRecord::Migration[5.2]
  def change
  	add_index :applications, :token
  	add_index :chats, [:application_id, :number]
  	add_index :messages, [:chat_id, :msg_number]
  end
end
