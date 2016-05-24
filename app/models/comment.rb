class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  default_scope { order(created_at: :desc) }

  validates :content, :article, presence: true

  def posted_at
    created_at.strftime("%Y-%m-%d %H:%M")
  end

  def author
    user.try :username
  end
end
