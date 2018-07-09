class AddViewsCountToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :views_count, :integer, default: 0
  end
end
