class Article < ApplicationRecord
    belongs_to :category
    belongs_to :user
    # validates :title, presence: true, uniqueness: true
    # validates :text, presence: true
    # validates :author, presence: true
end
