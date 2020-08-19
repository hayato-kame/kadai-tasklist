class Task < ApplicationRecord
  
 belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  validates :status, presence: true, length: { maximum: 10 }
  
end

# belongs_to :user の関連付けによって、
# ユーザの紐付け無しには Taskを保存できません。
# belongs_to :user の関連付けによって、
# Task のインスタンスでインスタンスメソッド user が使えるようになります。

# 使用例：task.user

# このuserメソッドで、
# ある投稿に紐付いた User のインスタンスを取得することができます。