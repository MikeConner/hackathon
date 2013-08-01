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

require 'spec_helper'

describe Burden do
  pending "add some examples to (or delete) #{__FILE__}"
end
