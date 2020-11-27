class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.text :bio
      t.text :likes
      t.text :dislikes
      t.boolean :is_male
      t.string :sex_pref

      t.timestamps
    end
  end
end
