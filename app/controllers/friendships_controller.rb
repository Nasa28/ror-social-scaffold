class FriendshipsController < ApplicationController
  def create
    user = User.find(params[:id])
    redirect_to root_path, notice: 'Friendship invite sent'
    Friendship.create(user_id: current_user.id, friend_id: user.id, status: false)
    
  end

  def update
    user = User.find(params[:id])
    current_user.confirm_friend(user)
    redirect_to user, notice: 'friend request accepted'
  end

  def destroy
    user = User.find(params[:id])
    current_user.reject_friendship(user)
    redirect_to root_path, notice: 'request rejected'
  end
end

