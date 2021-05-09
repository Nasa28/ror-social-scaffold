class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  def self.remove_friendships(user, friend)
    friendship = where(user: user, friend: friend)
      .or(where(user: friend, friend: user))

    friendship.destroy_all
  end
end
