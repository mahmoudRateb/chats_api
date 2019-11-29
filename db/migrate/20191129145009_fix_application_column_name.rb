class FixApplicationColumnName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :applications, :token_digest, :token
  end
end
