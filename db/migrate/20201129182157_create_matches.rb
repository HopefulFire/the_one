class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :user_id
      t.integer :matched_user_id
      t.boolean :blocked

      t.timestamps
    end
  end
end
