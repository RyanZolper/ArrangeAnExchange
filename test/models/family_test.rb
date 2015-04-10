# == Schema Information
#
# Table name: families
#
#  id         :integer          not null, primary key
#  name       :string
#  profpic    :string
#  housepic   :string
#  tagline    :string
#  hostdates  :string
#  pvtbed     :boolean
#  pvtbath    :boolean
#  beds       :integer
#  baths      :integer
#  size       :integer
#  features   :string           default("{}"), is an Array
#  country    :string
#  city       :string
#  address    :string
#  age_range  :string           default("{}"), is an Array
#  morepics   :string           default("{}"), is an Array
#  smokers    :boolean
#  env        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bio        :text
#  lifehere   :text
#  attracts   :text
#

require 'test_helper'

class FamilyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
