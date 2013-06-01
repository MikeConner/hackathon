class Like < ActiveRecord::Base
  attr_accessible :user_identifier, :comment,
                  :suggestion_id
        
  belongs_to :suggestion
            
  validates_presence_of :user_identifier
  validates_presence_of :comment
end
