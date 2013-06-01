class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.references :property
      t.string :category
      t.string :description
      t.string :user_identifier

      t.timestamps
    end
  end
end
