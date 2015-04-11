class CreateFamAttachments < ActiveRecord::Migration
  def change
    create_table :fam_attachments do |t|
      t.belongs_to :family, index: true
      t.string :image

      t.timestamps null: false
    end
  end
end
