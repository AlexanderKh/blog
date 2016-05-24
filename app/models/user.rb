class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  enum role: { user: 0, admin: 1 }

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

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
