class RemoveNullConstraintFormAnswers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :answers, :video, true
  end
end
