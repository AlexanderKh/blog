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

  def has_access_to? object
    true
  end
end
