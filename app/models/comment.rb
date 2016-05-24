class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  default_scope { order(created_at: :desc) }

  def posted_at
    created_at.strftime("%Y-%m-%d %H:%M")
  end
end
