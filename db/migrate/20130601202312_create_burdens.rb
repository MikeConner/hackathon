class CreateBurdens < ActiveRecord::Migration
  def change
    create_table :burdens do |t|
      t.references :property
      t.string :user_identifier
      
      t.timestamps
    end
  end
end
