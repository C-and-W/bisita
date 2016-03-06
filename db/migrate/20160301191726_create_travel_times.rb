class CreateTravelTimes < ActiveRecord::Migration
  def change
    create_table :travel_times do |t|
      t.string :transportation
      t.integer :hours
      t.integer :minutes
      t.integer :church_id

      t.timestamps null: false
    end
  end
end
