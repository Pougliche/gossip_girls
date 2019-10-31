class User < ApplicationRecord
    
    has_many :gossips
    validates :user_name, presence: true, uniqueness: true
    has_secure_password
    validates :password_digest, length: { minimum: 6 }, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please"}
    
end
