class AddUserToUpvotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :upvotes, :user, index: true, foreign_key: true
  end
end
