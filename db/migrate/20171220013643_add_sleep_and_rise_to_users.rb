class AddSleepAndRiseToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :sleep, :time
  	add_column :users, :rise, :time
  end
end
