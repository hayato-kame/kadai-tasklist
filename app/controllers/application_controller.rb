class ApplicationController < ActionController::Base
  
  
  include SessionsHelper
  
 private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end

# ログイン要求処理

# ログインしていないユーザに対しては見せたくない
# 事前に
# ログイン認証を確認するような処理を追加します。

# TasksController でも
# ログイン確認をしたいので、
# 全ての Controller で使用できるように、
# ApplicationController で require_user_logged_in を定義します。


# ApplicationController にメソッドを定義すると、
# 全ての Controller で定義したメソッドが使用できるようになります。
# なぜなら、全ての Controller が ApplicationController を継承しているからです。

# では、このメソッドを実際に TasksController で使用します。