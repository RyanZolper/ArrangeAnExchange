class CreateTravelers < ActiveRecord::Migration
  def change
    create_table :travelers do |t|
      t.string :name
      t.integer :age
      t.text :countries, array: true, default: []
      t.string :brief
      t.string :bio
      t.string :profpic
      t.text :allpics, array: true, default: []
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
