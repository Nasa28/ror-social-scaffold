class Friendship < ApplicationRecord
  belongs_to :creator, class_name: "User"
  belongs_to :friend, class_name: "User"

  scope :pending_requests, -> { where(status: false) }
  scope :confirmed_requests, -> { where(status: true) }

  def self.confirm_friend_request_for(user, friend)
    friendship = where(user: user, friend: friend)
                 .or(where(user: friend, friend: user))

    transaction do
      friendship.update(status: true)
      user.friendships.create(friend: friendship.first.user, status: true)
    end
  end

  def self.remove_friendship(user, friend)
    friendship = where(user: user, friend: friend)
                 .or(where(user: friend, friend: user))

    friendship.destroy_all
  end

  def self.unconfirmed_friends_for(user)
    pending_requests.where(friend: user).map(&:user)
  end

  def self.confirmed_friends_for(user)
    confirmed.where(user: user).map(&:friend)
  end

  def self_irreflexive
    msg = "can't be friends with self"
    errors.add(:friendship_is_irreflexive!, msg) if user == friend
  end
end
