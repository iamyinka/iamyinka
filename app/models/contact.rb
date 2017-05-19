class Contact < ApplicationRecord

	validates :name, presence: true, length: { minimum: 5 }
	validates :email, presence: true, length: { minimum: 10, maximum: 50 }
	validates :phone, presence: true, length: { minimum: 8, maximum: 20 }
	validates :description, presence: true, length: { minimum: 10 }

end
