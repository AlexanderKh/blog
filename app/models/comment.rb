class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  def posted_at
    created_at.strftime("%Y-%m-%d %H:%M")
  end
end
