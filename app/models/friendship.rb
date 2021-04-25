class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'

  scope :pending_requests, -> { where(status: false) }
  scope :friends, -> { where(status: true) }
end
