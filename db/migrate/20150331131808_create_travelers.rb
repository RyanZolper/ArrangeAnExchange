class CreateTravelers < ActiveRecord::Migration
  def change
    create_table :travelers do |t|
      t.string :name
      t.integer :age
      t.string :destinations, array: true, default: []
      t.string :trvldates
      t.text :bio
      t.string :tagline
      t.string :pic
      t.belongs_to :family, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
