class Message < ApplicationRecord
  belongs_to :sender, class_name: :User, inverse_of: :sent_messages
  belongs_to :receiver, class_name: :User, inverse_of: :received_messages

  scope :sent_and_received_messages ->(user) do
  	where(
      'sender_id = ? OR receiver_id = ?',
      user.id,
      user.id
    ).order(created_at: :desc)
  end

  scope :chat ->(user, chat_user) do
  	where(
      'sender_id = ? AND receiver_id = ? OR sender_id = ? AND receiver_id = ?',
      user.id,
      chat_user.id,
      chat_user.id,
      user.id
    ).order(created_at: :desc).limit(50).reverse
  end
end
