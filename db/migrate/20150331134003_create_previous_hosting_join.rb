class CreatePreviousHostingJoin < ActiveRecord::Migration
  def change
    create_table :previous_hosting, id: false do |t|
      t.integer :family_id
      t.integer :traveler_id
    end

  end
end
