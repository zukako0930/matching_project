class UsersController < ApplicationController
  before_action :set_user, only: [:profile,:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def profile
  end

  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end
  # GET /users/new
  def new
    @age_range = (18..99).to_a
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
       redirect_to controller: "sessions", action:"new", notice:"ユーザの登録に成功しました"
    else
      redirect_to action: "new", notice:"有効な値を入力してください"
    end
    # respond_to do |format|
    #   if @user.save
    #     format.html { redirect_to @user, notice: 'User was successfully created.' }
    #     format.json { render :show, status: :created, location: @user }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      redirect_to match_requests_target_user_list_path, notice:"プロフィールを更新しました。"
    end
    # respond_to do |format|
    #   if @user.update(user_params)
    #     format.html { redirect_to @user, notice: 'User was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @user }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      @current_user = User.find_by(id: session[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :string, :image, :email, :password, :prof, :sex, :age, :place)
    end
end
