# == Schema Information
#
# Table name: connections
#
#  id          :integer          not null, primary key
#  family_id   :integer
#  traveler_id :integer
#  hostreview  :string
#  travreview  :string
#  hoststars   :integer
#  travstars   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Connection < ActiveRecord::Base
  belongs_to :family
  belongs_to :traveler
end
