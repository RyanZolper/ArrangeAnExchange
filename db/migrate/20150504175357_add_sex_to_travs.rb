class AddSexToTravs < ActiveRecord::Migration
  def change
    change_table :travelers do |t|
      t.string :sex
    end
  end
end
