class CreatePanos < ActiveRecord::Migration
  def change
    create_table :panos do |t|
      t.text :pano_id
      t.integer :church_id

      t.timestamps null: false
    end
  end
end
