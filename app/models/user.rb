class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :reviews, through: :events
  validates :first_name, :last_name, :nickname, presence: true, length: { minimum: 3 }
  validates :description, length: { minimum: 3 }
  validates :description_cannot_be_blank_or_whitespace

  private

  def description_cannot_be_blank_or_whitespace
    if description.strip.empty?
      errors.add(:description, "cannot be blank or consist only of whitespace")
    end
  end
end
