class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :parcel_id, :limit => Property::PARCEL_LEN
      t.string :address, :limit => Property::ADDRESS_LEN
      t.integer :land_value
      t.integer :building_value
      t.integer :taxes
      t.string :owner, :limit => Property::OWNER_LEN
      t.boolean :vacant
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
