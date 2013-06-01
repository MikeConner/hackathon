class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :suggestion
      t.string :user_identifier
      t.text :comment
      
      t.timestamps
    end
  end
end
