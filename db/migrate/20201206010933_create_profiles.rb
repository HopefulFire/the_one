class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.text :bio
      t.text :likes
      t.text :dislikes
      t.integer :user_id

      t.timestamps
    end
    add_index :profiles, :user_id, unique: true
  end
end
