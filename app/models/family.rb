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
#  features   :string           default("{}"), is an Array
#  attracts   :string
#  country    :string
#  city       :string
#  address    :string
#  age_range  :string           default("{}"), is an Array
#  morepics   :string           default("{}"), is an Array
#  smokers    :boolean
#  env        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Family < ActiveRecord::Base
  mount_uploader :housepic, PicUploader
  has_many :fam_attachments
  accepts_nested_attributes_for :fam_attachments
  has_many :users
  has_many :travelers
  has_and_belongs_to_many :interesteds, class_name: "User", join_table: "save_interest", inverse_of: :saves
  has_and_belongs_to_many :hosteds, class_name: "Traveler", join_table: "previous_hosting", inverse_of: :hosts

  def self.search(query)
    @a = ["Anywhere!", ""]
    if @a.include?(query[0])
      @step = Family.where(["?=ANY(age_range)", query[1]])
    else
      @step = Family.where(["country = ? and ?=ANY(age_range)", query[0], query[1]])
    end
    #@result = Array.new
    #  @step.each do |p|
    #    if p.destinations.include?(query[1])
    #      @result << p
    #    end
    #  end
    #return @result


  end

end
