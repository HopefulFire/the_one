class CreateIdentities < ActiveRecord::Migration[6.0]
  def change
    create_table :identities do |t|
      t.string :nickname
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :provider
      t.string :uid

      t.timestamps
    end
    add_index :identities, :uid, unique: true
  end
end
