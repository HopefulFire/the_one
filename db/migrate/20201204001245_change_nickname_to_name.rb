class ChangeNicknameToName < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :nickname, :name
    change_column :identities, :nickname, :name
  end
end
