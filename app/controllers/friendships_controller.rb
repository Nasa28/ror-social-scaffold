class FriendshipsController < ApplicationController
  def index
  end

  def new 
    @friendship = Friendship.new
  end

    def create 
      @friendship = current_user.friendship.build(params[:id])
      if @friendship.save
      flash.now[:notice] = 'saved successfully'

      else 
        flash.now[:notice] = 'Try again'
      end 
    end
end
