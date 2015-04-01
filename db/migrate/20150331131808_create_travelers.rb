class CreateTravelers < ActiveRecord::Migration
  def change
    create_table :travelers do |t|
      t.string :name
      t.integer :age
      t.string :destinations, array: true, default: []
      t.string :trvldates
      t.string :bio
      t.string :tagline

      t.timestamps null: false
    end
  end
end
