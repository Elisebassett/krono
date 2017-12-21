class AddTypeFieldToGoals < ActiveRecord::Migration[5.1]
  def change
    add_column :goals, :type, :string
  end
end
