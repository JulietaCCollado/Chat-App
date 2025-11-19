class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
 #prevents duplicated memberships
  validates :user_id, uniqueness: { scope: :chat_room_id }
end
