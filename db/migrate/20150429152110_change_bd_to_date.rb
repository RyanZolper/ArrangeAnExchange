class ChangeBdToDate < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :bd
      t.date :bd
    end
  end
end
