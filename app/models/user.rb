class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  # To login with username
  def email_required?
    false
  end

  def email_changed?
    false
  end
end
