class SessionsController < ApplicationController
  # ログインフォームのためのコントローラ
  def new
  end
  def create #scaffoldなら自動生成？
    # userにデータベースからemail検索したuserを入れる
    user = User.find_by(email: params[:session][:email].downcase)
    # もしuserが存在してpasswordが合致していたらログイン後のホームへ
    if user && user.authenticate(params[:session][:password]) then
      # sessions_helperに定義した関数
      log_in user
      # user_url(user)へのルーティングと同義
      redirect_to user
    # ユーザが見つからなければ
    else
      #エラーメッセージを出してログインホームへ
      # flash[:error] = 'Invalid email/password combination'
      @error = "メールアドレスかパスワードが間違っています。"
      render 'new'
    end
  end
  def destroy
  end
end
