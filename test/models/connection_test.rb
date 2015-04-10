# == Schema Information
#
# Table name: connections
#
#  id          :integer          not null, primary key
#  family_id   :integer
#  traveler_id :integer
#  hoststars   :integer
#  travstars   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  hostreview  :text
#  travreview  :text
#

require 'test_helper'

class ConnectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
