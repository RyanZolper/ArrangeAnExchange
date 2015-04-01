class CreateSaveInterestJoinTable < ActiveRecord::Migration
  def change
    create_table :save_interest, id: false do |t|
      t.integer :user_id
      t.integer :family_id
    end

  end
end
