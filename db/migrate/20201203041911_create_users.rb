class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :provider
      t.string :uid

      t.timestamps
    end
    add_index :users, :uid
    add_index :users, :provider
  end
end
