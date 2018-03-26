class User < ApplicationRecord
	has_secure_password

	validates :email, presence: true
	validates :email, format: /.+@.+\..+/i
	validates :password, confirmation: true
	validates :password, length: { minimum: 6 }
	validates :password_confirmation, presence: true
end