class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true
  validates :name, :check_name, presence: true

  def check_name
    unless name.split.size > 1
      errors.add(:name, 'Need first and last name')
    end
  end

end
