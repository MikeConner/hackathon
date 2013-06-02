# == Schema Information
#
# Table name: suggestions
#
#  id              :integer         not null, primary key
#  property_id     :integer
#  category        :string(255)
#  description     :string(255)
#  user_identifier :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class Suggestion < ActiveRecord::Base
  DEFAULT_CATEGORY = 'Housing'
  CATEGORIES = ['Grocery', 'Restaurant', 'Art Space', 'Coworking Space', 'Burlesque', 'Bar', 'Retail', 'Park', 'Housing', 'Pharmacy', 'Waffle House', 'Other']
  
  attr_accessible :category, :description, :user_identifier,
                  :property_id
                  
  belongs_to :property
  has_many :likes, :dependent => :destroy
  
  validates_inclusion_of :category, :in => CATEGORIES
  validates_presence_of :description
  validates_presence_of :user_identifier
end
