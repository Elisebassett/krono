class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.integer :time_allocation
      t.references :user, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
