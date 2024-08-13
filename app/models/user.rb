class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :reviews, through: :events
  has_one :fighter
  validates :first_name, :last_name, presence: true, length: { minimum: 3 }
  validates :description, length: { minimum: 3 }, format: { with: /\A\S.*\S\z|\A\S\z/, message: "cannot be blank or consist only of whitespace" }
end
