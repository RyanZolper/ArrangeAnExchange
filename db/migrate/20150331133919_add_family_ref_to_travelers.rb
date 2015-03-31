class AddFamilyRefToTravelers < ActiveRecord::Migration
  def change
    add_reference :travelers, :family, index: true
    add_foreign_key :travelers, :families
  end
end
