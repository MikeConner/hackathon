class ExtendOwnerInProperties < ActiveRecord::Migration
  def up
    remove_column :properties, :owner
    add_column :properties, :owner, :string, :limit => Property::OWNER_LEN
  end

  def down
    remove_column :properties, :owner
    add_column :properties, :owner, :string, :limit => 64
  end
end
