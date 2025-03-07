class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }
  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :pending_friendships, -> { where status: false }, class_name: 'Friendship', foreign_key: 'user_id'
  has_many :pending_friends, through: :pending_friendships, source: :friend
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id', dependent: :destroy
  has_many :confirm_friendship, -> { where status: true }, class_name: 'Friendship'
  has_many :friends, through: :confirmed_friendships
  scope :all_except, ->(user) { where.not(id: user) }
  def friends
    friendships.map { |friendship| friendship.friend if friendship.status }.compact
  end

  def friend_requests
    inverse_friendships.map { |friendship| friendship.user unless friendship.status }.compact
  end

  def friend?(user)
    friends.include?(user)
  end

  def reject_request(user)
    friends = inverse_friendships.find { |friend| friend.user == user }
    friends.destroy
  end

  def friend_ids
    ids = friends.map(&:id)
    ids.push(id)
  end

  def friends_and_own_posts
    Post.where(user: friend_ids)
  end
end
