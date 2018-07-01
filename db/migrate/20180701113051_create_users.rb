class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :avatar
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :api_token, index: true

      t.timestamps
    end
  end
end
