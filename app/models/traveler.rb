# == Schema Information
#
# Table name: travelers
#
#  id           :integer          not null, primary key
#  name         :string
#  age          :integer
#  destinations :string           default("{}"), is an Array
#  trvldates    :string
#  tagline      :string
#  pic          :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  family_id    :integer
#  user_id      :integer
#  bio          :text
#

class Traveler < ActiveRecord::Base
  mount_uploader :pic, PicUploader
  belongs_to :family, inverse_of: :travelers
  belongs_to :user, inverse_of: :travelers
  has_many :connections
  has_many :hosts, :through => :connections, :source => :family
end
