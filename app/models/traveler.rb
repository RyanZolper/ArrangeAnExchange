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

class Traveler < ActiveRecord::Base
  belongs_to :user
  mount_uploader :profpic, PicUploader
  mount_uploader :allpics, PicUploader
end
