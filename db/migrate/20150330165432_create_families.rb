class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :name
      t.string :profpic
      t.string :housepic
      t.string :brief
      t.string :bio
      t.text :allpics, array: true, default: []
      t.belongs_to :user, index: true
      t.string :country
      t.string :locations

      t.timestamps null: false
    end
    add_foreign_key :families, :users
  end
end
