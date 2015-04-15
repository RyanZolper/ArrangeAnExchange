# == Schema Information
#
# Table name: families
#
#  id         :integer          not null, primary key
#  name       :string
#  profpic    :string
#  housepic   :string
#  bio        :text
#  tagline    :string
#  hostdates  :string
#  pvtbed     :boolean
#  pvtbath    :boolean
#  beds       :integer
#  baths      :integer
#  size       :integer
#  lifehere   :text
#  features   :string           default("{}"), is an Array
#  attracts   :text
#  country    :string
#  city       :string
#  address    :string
#  age_range  :string           default("{}"), is an Array
#  morepics   :string           default("{}"), is an Array
#  smokers    :boolean
#  env        :string
#  showing    :boolean          default("true")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FamilyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
