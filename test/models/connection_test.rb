# == Schema Information
#
# Table name: connections
#
#  id          :integer          not null, primary key
#  family_id   :integer
#  traveler_id :integer
#  hostreview  :text
#  travreview  :text
#  hoststars   :float
#  travstars   :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ConnectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
