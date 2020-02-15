class PublicPagesController < ApplicationController

  def home
    if authenticate_user!
      @topics = Topic.all.order(created_at: 'desc')
    end
  end

  def help
  end

end
