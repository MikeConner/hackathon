# == Schema Information
#
# Table name: properties
#
#  id             :integer          not null, primary key
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

class Property < ActiveRecord::Base
  PARCEL_LEN = 20
  ADDRESS_LEN = 128
  OWNER_LEN = 128
  
  attr_accessible :parcel_id, :address, :land_value, :building_value, :owner, :vacant, :taxes, :latitude, :longitude, :tax_category, :lot_area
  
  acts_as_gmappable :process_geocoding => false
  geocoded_by :address
  
  
  has_many :burdens, :dependent => :destroy
  has_many :suggestions, :dependent => :destroy
  has_many :likes, :through => :suggestions
  
  def gmaps4rails_address
    self.address
  end
  
  def mappable?
    !self.latitude.nil? and !self.longitude.nil?
  end
  
  def value
    self.land_value + self.building_value
  end
  
  validates :parcel_id, :presence => true,
                        :length => { :maximum => PARCEL_LEN },
                        :uniqueness => true
  validates :address, :presence => true,
                      :length => { :maximum => ADDRESS_LEN }
  validates :land_value, :presence => true,
                         :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  validates :building_value, :presence => true,
                             :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  validates :taxes, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }, :allow_nil => true
  validates :owner, :presence => true,
                    :length => { :maximum => OWNER_LEN }
  validates_inclusion_of :vacant, :in => [true, false]
  validates_presence_of :tax_category
  validates_numericality_of :latitude, :allow_nil => true
  validates_numericality_of :longitude, :allow_nil => true  
end
