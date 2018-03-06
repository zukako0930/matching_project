class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    if flash[:send_id]
      send_id = flash[:send_id]
      receive_id = flash[:receive_id]
    else
      send_id = params[:send_id]
      receive_id = params[:receive_id]
    end

    if params[:send_id]
      @messages = Message.talk(params[:receive_id], params[:send_id])
      @send_user = User.find(params[:send_id])
      @receive_user = User.find(params[:receive_id])
    elsif send_id
      @messages = Message.talk(receive_id, send_id)
      @send_user = User.find(send_id)
      @receive_user = User.find(receive_id)
    else
      @messages = Message.all
    end
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
    @send_user = User.find(@message.send_user_id)

    redirect_to action: "index", :send_id => @message.send_user_id, :receive_id => @message.receive_user_id

#    respond_to do |format|
#        @send_user = User.find(@message.send_user_id)
  #      @receive_user = User.find(@message.receive_user_id)
  #      redirect_to action: "index"
  #      #format.html　{render :action => "index" ,:flash => {:send_id => @message.send_user_id, :receive_id => @message.receive_user_id  } }
  #      #format.json { render :index, status: :created, location: @message }
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
end
