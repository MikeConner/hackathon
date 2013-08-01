# == Schema Information
#
# Table name: suggestions
#
#  id              :integer          not null, primary key
#  property_id     :integer
#  category        :string(255)
#  description     :string(255)
#  user_identifier :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  title           :string(140)
#

require 'spec_helper'

describe Suggestion do
  pending "add some examples to (or delete) #{__FILE__}"
end
