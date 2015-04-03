# == Schema Information
#
# Table name: fam_attachments
#
#  id         :integer          not null, primary key
#  family_id  :string
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FamAttachmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
