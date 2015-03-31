class AddFamilyRefToUser < ActiveRecord::Migration
  def change
    add_reference :users, :family, index: true
    add_foreign_key :users, :families
  end
end
