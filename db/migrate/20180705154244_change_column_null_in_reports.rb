class ChangeColumnNullInReports < ActiveRecord::Migration[5.2]
  def change
    change_column_null :reports, :content, true
    add_column :reports, :category, :string
  end
end
