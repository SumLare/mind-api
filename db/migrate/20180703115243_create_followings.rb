class CreateFollowings < ActiveRecord::Migration[5.2]
  def change
    create_table :followings do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :follower_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
