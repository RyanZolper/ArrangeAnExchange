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

class User < ActiveRecord::Base
  validates :email,
    :presence => { message: " required"},
    :uniqueness => { message: " belongs to an existing account" }
  validates :first_name, :presence => { message: " required"}
  validates :last_name, :presence => { message: " required"}
  validates :bd, :presence => { message: " required"}  
  validate :bd_check
  belongs_to :family, inverse_of: :users
  has_many :travelers
  has_secure_password
  has_and_belongs_to_many :saves, class_name: "Family", join_table: "save_interest", inverse_of: :interesteds

  def bd_check
    if bd > Date.today - 18.years
      errors.add(:base, "User must be 18. Please ask a parent for help, if you need to.")
    end
  end


end
