class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, length: { minimum: 3 }, confirmation: true
end
