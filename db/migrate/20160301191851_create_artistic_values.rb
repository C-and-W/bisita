class CreateArtisticValues < ActiveRecord::Migration
  def change
    create_table :artistic_values do |t|
      t.text :description
      t.integer :church_id
      t.timestamps null: false
    end
  end
end
