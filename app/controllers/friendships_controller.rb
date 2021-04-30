class FriendshipsController < ApplicationController
  def create
    new_user = User.find(params[:id])
    redirect_to root_path, notice: 'Friendship Request Sent' if
    Friendship.create(user_id: current_user.id, friend_id: new_user.id, status: false)
  end

  def update
    new_user = User.find(params[:id])
    return unless current_user.confirm_friend(new_user)

    Friendship.update(user_id: current_user.id, friend_id: new_user.id, status: true)
    redirect_to new_user, notice: 'Request Accepted'
  end

  def destroy
    new_user = User.find(params[:id])
    current_user.reject_request(new_user)
    redirect_to root_path, notice: 'Request Rejected'
  end

  def remove_friend
    remove_friendship = current_user.friendships.find_by(params[:status])
    remove_friendship.destroy
    redirect_to root_path, notice: 'Friend Removed Successfully'
  end
end
