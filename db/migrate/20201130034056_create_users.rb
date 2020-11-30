class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :nickname
      t.string :password_digest
      t.string :uid

      t.timestamps
    end
    add_index :users, :uid, unique: true
  end
end
