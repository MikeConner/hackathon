# == Schema Information
#
# Table name: burdens
#
#  id              :integer          not null, primary key
#  property_id     :integer
#  user_identifier :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Burden < ActiveRecord::Base
  attr_accessible :user_identifier,
                  :property_id
  
  belongs_to :property
  
  validates_presence_of :user_identifier
end
