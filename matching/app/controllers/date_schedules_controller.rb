class DateSchedulesController < ApplicationController
  before_action :set_date_schedule, only: [:show, :edit, :update, :destroy]

  # GET /date_schedules
  # GET /date_schedules.json
  def index
    @date_schedules = DateSchedule.all
  end

  # GET /date_schedules/1
  # GET /date_schedules/1.json
  def show
  end

  # GET /date_schedules/new
  def new
    @date_schedule = DateSchedule.new
  end

  # GET /date_schedules/1/edit
  def edit
  end

  # POST /date_schedules
  # POST /date_schedules.json
  def create
    @date_schedule = DateSchedule.new(date_schedule_params)

    respond_to do |format|
      if @date_schedule.save
        format.html { redirect_to @date_schedule, notice: 'Date schedule was successfully created.' }
        format.json { render :show, status: :created, location: @date_schedule }
      else
        format.html { render :new }
        format.json { render json: @date_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /date_schedules/1
  # PATCH/PUT /date_schedules/1.json
  def update
    respond_to do |format|
      if @date_schedule.update(date_schedule_params)
        format.html { redirect_to @date_schedule, notice: 'Date schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @date_schedule }
      else
        format.html { render :edit }
        format.json { render json: @date_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /date_schedules/1
  # DELETE /date_schedules/1.json
  def destroy
    @date_schedule.destroy
    respond_to do |format|
      format.html { redirect_to date_schedules_url, notice: 'Date schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_date_schedule
      @date_schedule = DateSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def date_schedule_params
      params.require(:date_schedule).permit(:date_sug_user_id, :date_tar_user_id, :date_of_meet, :confirm)
    end
end
