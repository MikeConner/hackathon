# == Schema Information
#
# Table name: suggestions
#
#  id              :integer         not null, primary key
#  property_id     :integer
#  category        :string(255)
#  description     :string(255)
#  user_identifier :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  title           :string(140)
#

class Suggestion < ActiveRecord::Base
  DEFAULT_CATEGORY = 'Housing'
  CATEGORIES = ['Grocery', 'Restaurant', 'Parking', 'Art Space', 'Coworking Space', 'Strip Club', 'Bar', 'Retail', 'Park', 'Housing', 'Pharmacy', 'Waffle House', 'Other']
  TITLE_LEN = 140
  
  attr_accessible :category, :description, :user_identifier, :title,
                  :property_id
                  
  belongs_to :property
  has_many :likes, :dependent => :destroy
  
  validates_inclusion_of :category, :in => CATEGORIES
  validates :title, :presence => true,
                    :length => { :maximum => TITLE_LEN }
  validates_presence_of :user_identifier
end
