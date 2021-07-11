class User < ApplicationRecord
    
    has_secure_password
    has_many :docvisits
    has_many :doctors, :through => :docvisits
    validates :username, :email, presence: true
end
