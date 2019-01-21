class User < ActiveRecord::Base

  before_validation :downcase_email
  
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validate :check_name
  validates :password, presence: true, length: {:within => 6..12}
  validates :password_confirmation, presence: true

  private 

  def check_name
    unless name.split.size > 1
      errors.add(:name, 'Need first and last name')
    end
  end

  def downcase_email
    self.email = email.downcase if email.present?
  end

end
