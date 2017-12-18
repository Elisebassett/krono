class ChangeColumnsInEvents < ActiveRecord::Migration[5.1]
  def change
  	change_column :events, :start_time, :string
  	change_column :events, :start_date, :string
  	change_column :events, :end_time, :string
  	change_column :events, :end_date, :string
  end
end
