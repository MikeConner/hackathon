# == Schema Information
#
# Table name: likes
#
#  id              :integer         not null, primary key
#  suggestion_id   :integer
#  user_identifier :string(255)
#  comment         :text
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  positive        :boolean
#

class Like < ActiveRecord::Base
  attr_accessible :user_identifier, :comment, :positive,
                  :suggestion_id
        
  belongs_to :suggestion

  scope :positives, where("positive = #{ActiveRecord::Base.connection.quoted_true}")           
  scope :negatives, where("positive = #{ActiveRecord::Base.connection.quoted_false}")           

  validates_presence_of :user_identifier
  validates_inclusion_of :positive, :in => [true, false]
  validate :cannot_like_your_own_idea
  
private
  def cannot_like_your_own_idea
    if self.suggestion.user_identifier == self.user_identifier
      self.errors.add(:base, 'Sorry; you cannot like your own idea')
    end
  end
end
