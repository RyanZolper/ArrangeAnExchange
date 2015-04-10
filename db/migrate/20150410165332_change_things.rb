class ChangeThings < ActiveRecord::Migration
  def change
    change_table :families do |t|
      t.remove :bio, :lifehere, :attracts
      t.text :bio
      t.text :lifehere
      t.text :attracts
    end

    change_table :travelers do |t|
      t.remove :bio
      t.text :bio
    end

    change_table :connections do |t|
      t.remove :hostreview, :travreview
      t.text :hostreview
      t.text :travreview
    end
  end
end


# MAKE SURE TO CHANGE STARS NUMBER TO FLOAT
