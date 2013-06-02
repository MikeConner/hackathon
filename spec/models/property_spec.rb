# == Schema Information
#
# Table name: properties
#
#  id             :integer         not null, primary key
#  parcel_id      :string(20)
#  address        :string(128)
#  land_value     :integer
#  building_value :integer
#  taxes          :integer
#  vacant         :boolean
#  latitude       :decimal(, )
#  longitude      :decimal(, )
#  created_at     :datetime
#  updated_at     :datetime
#  tax_category   :string(255)
#  lot_area       :integer
#  owner          :string(128)
#

require 'spec_helper'

describe Property do
  pending "add some examples to (or delete) #{__FILE__}"
end
