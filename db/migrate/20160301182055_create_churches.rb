class CreateChurches < ActiveRecord::Migration
  def change
    create_table :churches do |t|
      t.string :name
      t.string :location
      t.integer :year
      t.text :year_note
      t.string :architecture
      t.integer :distance
      t.string :make
      t.string :region
      t.float :latitude
      t.float :longitude
      t.text :background
      t.text :bg_title1
      t.text :bg_title2
      t.string :fact_title
      t.integer :artistic_value

      t.timestamps null: false
    end
  end
end
