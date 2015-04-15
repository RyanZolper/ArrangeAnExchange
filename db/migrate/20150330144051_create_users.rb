class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :name
      t.string :email
      t.string :country
      t.string :password_digest
      t.belongs_to :family, index: true
      t.timestamps null: false
      t.boolean :admin, default: false
      t.boolean :changedpwd, default: false
    end
  end
end
