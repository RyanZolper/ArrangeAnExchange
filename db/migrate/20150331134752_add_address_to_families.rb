class AddAddressToFamilies < ActiveRecord::Migration
  def change
    add_column :families, :country, :string
    add_column :families, :address, :string
    add_column :families, :city, :string
  end
end
