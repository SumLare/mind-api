class CreateUpvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :upvotes do |t|
      t.belongs_to :upvotable, polymorphic: true

      t.timestamps
    end
  end
end
