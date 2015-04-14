class AlterFam < ActiveRecord::Migration
  def change
    change_table :families do |t|
      t.remove :show
      t.boolean :showing, default: true
    end
  end
end
