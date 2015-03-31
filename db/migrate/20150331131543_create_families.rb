class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :name
      t.string :profpic
      t.string :housepic
      t.string :bio
      t.string :tagline
      t.string :hostdates
      t.boolean :pvtbed
      t.boolean :pvtbath
      t.integer :beds
      t.integer :baths
      t.integer :size
      t.string :lifehere
      t.string :features
      t.string :attracts

      t.timestamps null: false
    end
  end
end
