# == Schema Information
#
# Table name: families
#
#  id         :integer          not null, primary key
#  name       :string
#  profpic    :string
#  housepic   :string
#  brief      :string
#  bio        :string
#  allpics    :text             default("{}"), is an Array
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Family < ActiveRecord::Base
  belongs_to :user
  mount_uploader :profpic, PicUploader
  mount_uploader :allpics, PicUploader

end
