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

require 'spec_helper'

describe Like do
  pending "add some examples to (or delete) #{__FILE__}"
end
