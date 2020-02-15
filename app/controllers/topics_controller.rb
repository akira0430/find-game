class TopicsController < ApplicationController
  before_action :set_topic, only: [:index, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all.order(created_at: 'desc')
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @topics = Topic.all.order(created_at: 'desc')
    @topic = Topic.find_by(id: params[:id])
    @user = @topic.user
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find_by(id: params[:id])
    if @topic.user_id == current_user.id
      @topic.destroy
    else
      redirect_to root_path
    end
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic = Topic.find_by(id: params[:id])
    respond_to do |format|
      if @topic.user_id == current_user.id
         @topic.destroy
         format.html { redirect_to topics_url, notice: 'Topic was successfully destroyed.' }
         format.json { head :no_content }
      else
          format.html { render :new }
          format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
    #respond_to do |format|
      #format.html { redirect_to topics_url, notice: 'Topic was successfully destroyed.' }
      #format.json { head :no_content }
    #end
  end


  def email_user
    # trigger email send
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    message = params[:message]

    ContactMailer.email_user( first_name, last_name, email, message ).deliver_now

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find_by(id: params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:title, :address, :price, :game, :item_counts, :details, :photo, :photo_cache)
    end
end
