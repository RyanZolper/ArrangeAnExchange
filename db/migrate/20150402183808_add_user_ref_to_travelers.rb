class AddUserRefToTravelers < ActiveRecord::Migration
  def change
    add_reference :travelers, :user, index: true
    add_foreign_key :travelers, :users
  end
end
