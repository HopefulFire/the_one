class User < ApplicationRecord
  has_many :sent_messages, class_name: :Message, foreign_key: :sender_id, inverse_of: :sender
  has_many :recieved_messages, class_name: :Message, foreign_key: :reciever_id, inverse_of: :reciever
  has_many :users_sent, class_name: :User, foreign_key: :reciever_id, source: :reciever, through: :sent_messages
  has_many :users_recieved, class_name: :User, foreign_key: :sender_id, source: :sender, through: :recieved_messages
end
