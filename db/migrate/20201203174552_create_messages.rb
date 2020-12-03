class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :sender_id
      t.integer :receiver

      t.timestamps
    end
    add_index :messages, :sender_id
    add_index :messages, :receiver
  end
end
