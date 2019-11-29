class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.references :application, foreign_key: true
      t.integer :number
      t.integer :msgs_number

      t.timestamps
    end
  end
end
