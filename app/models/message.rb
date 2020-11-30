class Message < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: :User#, inverse_of: :sent_messages
  belongs_to :reciever, foreign_key: :reciever_id, class_name: :User#, inverse_of: :recieved_messages
end
