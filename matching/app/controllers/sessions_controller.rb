class SessionsController < ApplicationController
  # ログインフォームのためのコントローラ
  def new
    # render :layout => nil
  end
  def create #scaffoldなら自動生成？
    # userにデータベースからemail検索したuserを入れる
    user = User.find_by(email: params[:session][:email].downcase)
    # もしuserが存在してpasswordが合致していたらログイン後のホームへ
    if user && user.authenticate(params[:session][:password]) then
      # sessions_helperに定義した関数
      log_in user
      redirect_to match_requests_target_user_list_path
    else
      # ユーザが見つからなければ
      #エラーメッセージを出してログインホームへ
      # flash[:error] = 'Invalid email/password combination'
      @error = "メールアドレスかパスワードが間違っています。"
      render 'new'
    end
  end
  def destroy
    log_out
    redirect_to root_url
  end

  # def logout
  #   reset_session
  #   redirect_to '/'
  # end
end
