# Associations

- User
	- has_many :sent_messages, class_name: :messages, foreign_key: :sender_id
	- has_many :received_messages, class_name: :messages, foreign_key: :reciever_id
	- has_many :s_users, class_name: :user, foreign_key: :reciever_id, through: :conversations
	- has_many :r_users, class_name: :user, foreign_key: :sender_id, through: :conversations

- Message
	- belongs_to :sender, foreign_key: :sender_id, class_name: :user
	- belongs_to :reciever, foreign_key: :reciever_id, class_name: :user