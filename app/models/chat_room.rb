class ChatRoom < ApplicationRecord
  has_many :chats
  has_many :room_users
  has_many :users, through: :room_users
end
