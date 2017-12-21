class ChangeColumnTypeInGoals < ActiveRecord::Migration[5.1]
  def change
  	change_column :goals, :type, :string
  end
end
