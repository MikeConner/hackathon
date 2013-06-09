class AddUniqIndexToSuggestions < ActiveRecord::Migration
  def change
    add_index :suggestions, [:property_id, :user_identifier], :unique => true
  end
end
