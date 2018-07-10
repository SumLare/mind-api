class CreateVerificationTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :verification_tokens do |t|
      t.string :code
      t.string :email
      t.string :token
      t.boolean :verified

      t.timestamps
    end
  end
end
