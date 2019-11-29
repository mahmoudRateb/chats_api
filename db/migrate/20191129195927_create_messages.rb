class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :chat, foreign_key: true
      t.integer :msg_number

      t.timestamps
    end
  end
end
