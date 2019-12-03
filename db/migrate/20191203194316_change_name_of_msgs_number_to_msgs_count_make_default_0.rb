class ChangeNameOfMsgsNumberToMsgsCountMakeDefault0 < ActiveRecord::Migration[5.2]
  def change
  	rename_column :chats, :msgs_number, :messages_count
  	change_column :chats, :messages_count, :integer, :default => 0
  end
end
