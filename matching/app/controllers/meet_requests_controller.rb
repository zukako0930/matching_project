class MeetRequestsController < ApplicationController
  before_action :set_meet_request, only: [:show, :edit, :update, :destroy]

  # GET /meet_requests
  # GET /meet_requests.json
  def index
    @meet_requests = MeetRequest.all
  end

  # GET /meet_requests/1
  # GET /meet_requests/1.json
  def show
  end



  # GET /meet_requests/new
  def new
    @meet_request = MeetRequest.new
  end

  # GET /meet_requests/1/edit
  def edit
  end

  # POST /meet_requests
  # POST /meet_requests.json
  def create
    @meet_request = MeetRequest.new(meet_request_params)
    @receive_user = User.find(@meet_request.meet_target_user_id)
    if @meet_request.save
      redirect_to controller: 'messages', action: 'index', :receive_id => @receive_user.id, notice: '会いたい！状態です。'
    else
      render :new, notice: '会いたいボタンエラー'
    end
    # respond_to do |format|
    #   if @meet_request.save
    #     format.html { redirect_to @meet_request, notice: 'Meet request was successfully created.' }
    #     format.json { render :show, status: :created, location: @meet_request }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @meet_request.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /meet_requests/1
  # PATCH/PUT /meet_requests/1.json
  def update
    respond_to do |format|
      if @meet_request.update(meet_request_params)
        format.html { redirect_to @meet_request, notice: 'Meet request was successfully updated.' }
        format.json { render :show, status: :ok, location: @meet_request }
      else
        format.html { render :edit }
        format.json { render json: @meet_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meet_requests/1
  # DELETE /meet_requests/1.json
  def destroy
    @meet_request.destroy
    respond_to do |format|
      format.html { redirect_to meet_requests_url, notice: 'Meet request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meet_request
      @meet_request = MeetRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meet_request_params
      params.require(:meet_request).permit(:meet_request_user_id, :meet_target_user_id)
    end
end
