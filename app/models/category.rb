class Category < ApplicationRecord
    has_many :articles, dependent: :destroy
    validates :category_name, presence: true, uniqueness: true
end
