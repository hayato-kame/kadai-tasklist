class User < ApplicationRecord
  
  before_save { self.email.downcase! }
  
  validates :name, presence: true, length: { maximum: 50 }

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  
  has_many :tasks
end

# User に設定した has_many :taks の関連付けによって、
# User のインスタンスでインスタンスメソッド tasks が使えるようになります。

# 使用例：user.tasks

# このtasksメソッドで、
# ある User が投稿した Tasks を全件取得することができます。
