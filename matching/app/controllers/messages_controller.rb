class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :login_check, only: [:show, :edit, :update, :destroy,:index]
# アクセスできない
  def check
    @messages = Message.all
  end

  # GET /messages
  # GET /messages.json
  def set_receive
    session[:receive_id] = params[:receive_id]
    redirect_to action: "index"
  end
  def index
    # session[:receive_id]=params[:receive_id]
    @current_user = User.find_by(id: session[:user_id])
    # if params[:receive_id] == nil
    #   params[:receive_id] == @current_user.id
    # end
    # @messages = Message.talk(params[:receive_id], @current_user.id)
    # @receive_user = User.find(params[:receive_id])
    # @meet = MeetRequest.exists?(meet_request_user_id: @current_user.id, meet_target_user_id: params[:receive_id])&& MeetRequest.exists?(meet_request_user_id: params[:receive_id], meet_target_user_id: @current_user.id)
    @messages = Message.talk(session[:receive_id], @current_user.id)
    @receive_user = User.find(session[:receive_id])
    @meet = MeetRequest.exists?(meet_request_user_id: @current_user.id, meet_target_user_id: @receive_user.id)&& MeetRequest.exists?(meet_request_user_id: @receive_user.id, meet_target_user_id: @current_user.id)

    @sug_schedules = DateSchedule.where(date_sug_user_id: @current_user.id,date_tar_user_id: @receive_user.id)
    @sugged_schedules = DateSchedule.where(date_sug_user_id: @receive_user.id,date_tar_user_id: @current_user.id)
    @match_to = MatchRequest.find_by(request_user_id:@current_user.id,target_user_id:@receive_user.id)
    @match_from = MatchRequest.find_by(request_user_id:@receive_user.id,target_user_id:@current_user.id)
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message.save
    @receive_user = User.find(@message.receive_user_id)
    session[:receive_id] = @message.receive_user_id
    redirect_to action: "index"
    # redirect_to action: "index",:receive_id => @message.receive_user_id

#    respond_to do |format|
  #      #format.html { redirect_to @message, notice: 'Message was successfully created.' }
  #      #format.json { render :show, status: :created, location: @message }
  #    else
  #      format.html { render :new }
  #      format.json { render json: @message.errors, status: :unprocessable_entity }
  #    end
  #  end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:body, :send_user_id, :receive_user_id)
    end
    def login_check
      if session[:user_id] == nil
        redirect_to controller:'sessions',action:'new', notice:'ログインしてください'
      end
    end
end
