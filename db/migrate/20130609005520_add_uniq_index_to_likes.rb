class AddUniqIndexToLikes < ActiveRecord::Migration
  def change
    add_index :likes, [:suggestion_id, :user_identifier], :unique => true
  end
end
