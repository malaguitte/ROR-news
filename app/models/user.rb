class User < ApplicationRecord
  # Uses bcrypt to safely store the password
  has_secure_password
  validates :username, :email, uniqueness: true
end