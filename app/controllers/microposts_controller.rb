class MicropostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @micropost = Micropost.new
    @microposts = Micropost.all.page(params[:page]).order(created_at: 'desc')
    @likes = Like.where(micropost_id: params[:micropost_id])
  end

  def create
    @micropost = Micropost.new(micropost_params)
    @micropost.user_id = current_user.id
    if @micropost.save
      redirect_to user_path(current_user)
      flash[:notice] = "投稿が保存されました"
    else
      render :alert
    end
  end

  def destroy
     @micropost = current_user.microposts.find_by(id: params[:id])
     @micropost.destroy
     flash[:notice] = "投稿を削除しました"
     redirect_to request.referrer
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :photo)
    end

end
