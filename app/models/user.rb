class User < ApplicationRecord
	has_many :articles
	has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :firstname, presence: true, length: { maximum: 20 }
  validates :lastname, presence: true, length: { maximum: 20 }
  validates :username, presence: true, length: { maximum: 20 }

end
