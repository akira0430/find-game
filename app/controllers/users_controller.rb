class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.page(params[:page]).order(created_at: 'desc')
  end

  def show
    @user = User.find_by(id: params[:id])
    @microposts = @user.microposts.build
    # @microposts = current_user.microposts.order(created_at: 'desc').page(params[:page])
    @microposts = @user.microposts.all.page(params[:page]).order(created_at: 'desc')
    #@micropost = @user.microposts.find_by(id: params[:id])
    @likes = Like.where(micropost_id: params[:micropost_id])
  end


  def destroy

  end

end
