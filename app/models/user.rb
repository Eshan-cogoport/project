class User < ApplicationRecord
    # require "securerandom"
    has_secure_password
    has_many :articles, dependent: :destroy
    validates :email, presence: true, format: {with: /\A\S+@.+\.\S+\z/}, uniqueness: true;
    validates :password, presence: true
    validates :username, presence: true, uniqueness: true
end
