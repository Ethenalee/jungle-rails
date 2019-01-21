class User < ActiveRecord::Base

  before_validation :downcase_email
  before_validation :no_blank
  
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validate :check_name
  validates :password, presence: true, length: {:within => 6..12}
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    email = email.downcase 
    email = email.strip
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
  
  private 

  def check_name
    unless name.split.size > 1
      errors.add(:name, 'Need first and last name')
    end
  end

  def downcase_email
    self.email = email.downcase if email.present?
  end

  def no_blank
    self.email = email.strip if email.present?
  end

end
