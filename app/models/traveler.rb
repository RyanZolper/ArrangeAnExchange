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

class Traveler < ActiveRecord::Base
  mount_uploader :pic, PicUploader
  belongs_to :family, inverse_of: :travelers
  belongs_to :user, inverse_of: :travelers
  has_and_belongs_to_many :hosts, class_name: "Family", :join_table => :previous_hosting, inverse_of: :hosteds
end
