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

class FamAttachment < ActiveRecord::Base
  mount_uploader :image, PicUploader
  belongs_to :family
end
