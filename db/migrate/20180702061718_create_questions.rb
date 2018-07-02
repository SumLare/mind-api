class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :content, null: false
      t.integer :upvotes_count, default: 0
      t.belongs_to :user, foreign_key: true
      t.belongs_to :respondent, index: true

      t.timestamps
    end
  end
end
