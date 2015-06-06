# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  country         :string
#  password_digest :string
#  family_id       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  admin           :boolean          default("false")
#  changedpwd      :boolean          default("false")
#  first_name      :string
#  last_name       :string
#  name            :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
