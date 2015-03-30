# == Schema Information
#
# Table name: travelers
#
#  id         :integer          not null, primary key
#  name       :string
#  age        :integer
#  countries  :text             default("{}"), is an Array
#  brief      :string
#  bio        :string
#  profpic    :string
#  allpics    :text             default("{}"), is an Array
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TravelerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
