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
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  country    :string
#  address    :string
#  city       :string
#

class Family < ActiveRecord::Base
  has_many :users
  has_many :travelers
  has_and_belongs_to_many :hosteds, class_name: "Traveler", :join_table => :previous_hosting, inverse_of: :hosts

  def self.search(query)
    where("title like ?", "%#{query}%")
  end

end
