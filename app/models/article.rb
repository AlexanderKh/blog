class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  has_attached_file :picture, :styles => { :medium => "500x500>", :thumb => "150x150>" }
  validates_attachment_content_type :picture, :content_type => /\Aimage/

  default_scope { order(created_at: :desc) }

  validates :title, :user, presence: true
  validates :content, presence: true, length: { minimum: 10 }

  def published_at
    created_at.strftime("%Y-%m-%d")
  end

  def author
    user.username
  end
end
