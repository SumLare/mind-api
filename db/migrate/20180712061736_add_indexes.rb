class AddIndexes < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, :api_token
    add_index :users, :api_token, unique: true
    add_index :verification_tokens, :token, unique: true
  end
end
