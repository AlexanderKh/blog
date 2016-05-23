class Article < ActiveRecord::Base
  has_many :comments

  has_attached_file :picture, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :picture, :content_type => /\Aimage/

  def published_at
    created_at.strftime("%Y-%m-%d")
  end
end
