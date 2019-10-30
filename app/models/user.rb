class User < ApplicationRecord
    
    has_many :gossips
    validates :user_name,
    presence: true,
    uniqueness: true
    
end
