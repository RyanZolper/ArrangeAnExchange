class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
       t.belongs_to :family, index: true
       t.belongs_to :traveler, index: true
       t.text :hostreview
       t.text :travreview
       t.float :hoststars
       t.float :travstars
       t.timestamps null: false
     end

  end
end
