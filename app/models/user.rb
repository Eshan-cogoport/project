class User < ApplicationRecord
    has_secure_password
    has_many :articles, dependent: :destroy
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    validates :username, presence: true, uniqueness: true
end
