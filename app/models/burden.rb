class Burden < ActiveRecord::Base
  attr_accessible :user_identifier,
                  :property_id
  
  belongs_to :property
  
  validates_presence_of :user_identifier
end
