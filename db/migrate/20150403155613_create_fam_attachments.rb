class CreateFamAttachments < ActiveRecord::Migration
  def change
    create_table :fam_attachments do |t|
      t.string :family_id
      t.string :image

      t.timestamps null: false
    end
  end
end
