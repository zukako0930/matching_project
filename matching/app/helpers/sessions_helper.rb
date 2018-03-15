module SessionsHelper
  # ユーザのidをsession[:user_id]に登録
  def log_in(user)
    session[:user_id] = user.id
  end
  # 現在ログインしているユーザーを返す (ユーザーがログイン中の場合のみ)
  def current_user
   # current_userが複数呼び出される場合にいちいちDBを参照しないように
   # インスタンス変数に代入する
   @current_user ||= User.find_by(id: session[:user_id])
   # idが無効な場合でも例外ではなくnilを返すためfind_by()を使う
   # find()だと例外処理に入ってしまう。
  end
  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end
  # ログアウトの実装
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
