class AddTaxDataToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :tax_category, :string
    add_column :properties, :lot_area, :integer
  end
end
