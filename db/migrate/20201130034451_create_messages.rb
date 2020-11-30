class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.foreign_key :sender_id
      t.foreign_key :reciever_id

      t.timestamps
    end
  end
end
