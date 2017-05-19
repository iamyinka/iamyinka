class Article < ApplicationRecord
	belongs_to :user
	has_many :comments

	validates :title, presence: true, length: { maximum: 30 }
	validates :description, presence: true, length: { minimum: 10 }
end
