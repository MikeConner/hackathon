class AddIndexToProperty < ActiveRecord::Migration
  def change
    add_index :properties, :parcel_id, :unique => true
  end
end
