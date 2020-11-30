class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :sender_id
      t.integer :reciever_id
      # t.foreign_key :sender baaad bad bad
      # t.foreign_key :reciever nooo no no

      t.timestamps
    end
  end
end
