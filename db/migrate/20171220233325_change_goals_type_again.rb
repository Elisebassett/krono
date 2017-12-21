class ChangeGoalsTypeAgain < ActiveRecord::Migration[5.1]
  def change
  	remove_column :goals, :type
  	add_column :goals, :color, :string 
  end
end
