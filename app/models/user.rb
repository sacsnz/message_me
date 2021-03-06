class User < ApplicationRecord
    validates :username, presence: true, 
        uniqueness: {case_sensitive: false}, 
        length: { minimum: 3, maximum: 15 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: {case_sensitive: false}, 
        length: {maximum: 105},
        format: { with: VALID_EMAIL_REGEX}
    has_secure_password
    validates :name, length: { minimum: 3, maximum: 15 }
    validates :age, presence: true
    has_many :messages
end
