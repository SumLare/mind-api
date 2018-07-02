class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :upvotes_count, default: 0
      t.belongs_to :user, foreign_key: true
      t.belongs_to :answer, foreign_key: true

      t.timestamps
    end
  end
end
