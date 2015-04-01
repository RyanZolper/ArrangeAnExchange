# == Schema Information
#
# Table name: families
#
#  id         :integer          not null, primary key
#  name       :string
#  profpic    :string
#  housepic   :string
#  bio        :string
#  tagline    :string
#  hostdates  :string
#  pvtbed     :boolean
#  pvtbath    :boolean
#  beds       :integer
#  baths      :integer
#  size       :integer
#  lifehere   :string
#  features   :string
#  attracts   :string
#  country    :string
#  city       :string
#  address    :string
#  age_range  :string           default("{}"), is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FamilyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
