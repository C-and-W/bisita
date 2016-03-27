class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :church
      t.string :category
      t.text :suggestion
    end
  end
end
