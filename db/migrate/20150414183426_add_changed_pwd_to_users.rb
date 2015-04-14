class AddChangedPwdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :changedpwd, :boolean, default: false
  end
end
