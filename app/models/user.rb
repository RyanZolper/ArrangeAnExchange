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
#

class User < ActiveRecord::Base
  has_and_belongs_to_many(:users,
    :join_table => "user_connections",
    :foreign_key => "user_a_id",
    :association_foreign_key => "user_b_id")
  has_one :family, inverse_of: :user
  has_many :travelers, inverse_of: :user
  has_secure_password



end
