class User < ActiveRecord::Base
  has_many :articles

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :username, presence: true
  validates :role, presence: true

  enum role: { user: 0, admin: 1 }

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  def has_access_to? object
    self == object.try(:user) or self.admin?
  end

  #To log in using username
  def email_required?
    false
  end

  def email_changed?
    false
  end
end
