class CreateFollowings < ActiveRecord::Migration[5.2]
  def change
    create_table :followings do |t|
      t.integer :followed_id, index: true
      t.integer :follower_id, index: true

      t.timestamps
    end

    add_index :followings, [:followed_id, :follower_id]
  end
end
