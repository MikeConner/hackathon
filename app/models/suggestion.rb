class Suggestion < ActiveRecord::Base
  CATEGORIES = ['Retail', 'Recreation']
  
  attr_accessible :category, :description, :user_identifier,
                  :property_id
                  
  belongs_to :property
  has_many :likes, :dependent => :destroy
  
  validates_inclusion_of :category, :in => CATEGORIES
  validates_presence_of :description
  validates_presence_of :user_identifier
end
