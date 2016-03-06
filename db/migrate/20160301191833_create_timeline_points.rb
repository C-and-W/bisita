class CreateTimelinePoints < ActiveRecord::Migration
  def change
    create_table :timeline_points do |t|
      t.string :year
      t.text :description
      t.integer :church_id
      t.timestamps null: false
    end
  end
end
