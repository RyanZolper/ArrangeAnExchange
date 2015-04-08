class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
       t.belongs_to :family, index: true
       t.belongs_to :traveler, index: true
       t.string :hostreview
       t.string :travreview
       t.integer :hoststars
       t.integer :travstars
       t.timestamps null: false
     end

  end
end
