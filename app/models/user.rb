class User < ApplicationRecord
  has_many :sent_messages, class_name: :Message, foreign_key: :sender_id, inverse_of: :sender
  has_many :received_messages, class_name: :Message, foreign_key: :receiver_id, inverse_of: :receiver
  has_many :users_sent, class_name: :User, foreign_key: :receiver_id, source: :receiver, through: :sent_messages
  has_many :users_received, class_name: :User, foreign_key: :sender_id, source: :sender, through: :received_messages
end
