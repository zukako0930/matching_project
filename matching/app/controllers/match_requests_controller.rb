class MatchRequestsController < ApplicationController
  before_action :set_match_request, only: [:show, :edit, :update, :destroy]

  # GET /match_requests
  # GET /match_requests.json
  def index
    @match_requests = MatchRequest.all
  end

  # GET /match_requests/1
  # GET /match_requests/1.json
  def show
  end

  # GET /match_requests/new
  def new
    @match_request = MatchRequest.new
  end

  # GET /match_requests/1/edit
  def edit
  end

  # POST /match_requests
  # POST /match_requests.json
  def create
    @match_request = MatchRequest.new(match_request_params)

    respond_to do |format|
      if @match_request.save
        format.html { redirect_to @match_request, notice: 'Match request was successfully created.' }
        format.json { render :show, status: :created, location: @match_request }
      else
        format.html { render :new }
        format.json { render json: @match_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /match_requests/1
  # PATCH/PUT /match_requests/1.json
  def update
    respond_to do |format|
      if @match_request.update(match_request_params)
        format.html { redirect_to @match_request, notice: 'Match request was successfully updated.' }
        format.json { render :show, status: :ok, location: @match_request }
      else
        format.html { render :edit }
        format.json { render json: @match_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /match_requests/1
  # DELETE /match_requests/1.json
  def destroy
    @match_request.destroy
    respond_to do |format|
      format.html { redirect_to match_requests_url, notice: 'Match request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match_request
      @match_request = MatchRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_request_params
      params.require(:match_request).permit(:request_user_id, :integer, :target_user_id, :integer)
    end
end
