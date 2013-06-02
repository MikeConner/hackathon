class AddFlagToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :positive, :boolean, :null => false, :default => true
  end
end
