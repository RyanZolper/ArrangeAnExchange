# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  country         :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  family_id       :integer
#

class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  belongs_to :family, inverse_of: :users
  has_many :travelers
  has_secure_password
  has_and_belongs_to_many :saves, class_name: "Family", join_table: "save_interest", inverse_of: :interesteds




end
