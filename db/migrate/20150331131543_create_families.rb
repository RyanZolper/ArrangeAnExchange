class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :name
      t.string :profpic
      t.string :housepic
      t.text :bio
      t.string :tagline
      t.string :hostdates
      t.boolean :pvtbed
      t.boolean :pvtbath
      t.integer :beds
      t.integer :baths
      t.integer :size
      t.text :lifehere
      t.string :features, array: true, default: []
      t.text :attracts
      t.string :country
      t.string :city
      t.string :address
      t.string :age_range, array: true, default: []
      t.string :morepics, array:true, default: []
      t.boolean :smokers
      t.string :env
      t.boolean :showing, default: true

      t.timestamps null: false
    end
  end
end
