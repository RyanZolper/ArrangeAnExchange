# == Schema Information
#
# Table name: travelers
#
#  id           :integer          not null, primary key
#  name         :string
#  age          :integer
#  destinations :string           default("{}"), is an Array
#  trvldates    :string
#  bio          :string
#  tagline      :string
#  pic          :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  family_id    :integer
#  user_id      :integer
#

require 'test_helper'

class TravelerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
