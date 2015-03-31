# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  family_id       :integer
#

class User < ActiveRecord::Base
  belongs_to :family, inverse_of: :users
  has_many :travelers
  has_secure_password



end
