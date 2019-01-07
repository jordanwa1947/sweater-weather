class User < ApplicationRecord
  has_secure_password

  has_many :favorites

  validates :password, presence: true, on: :create
  validates :password, confirmation: {case_sensitive: true}

  validates :email, presence: true, uniqueness: true
end
