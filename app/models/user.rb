class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :reviews, through: :events
  has_one :fighter
  has_one_attached :photo

  validates :first_name, :last_name, presence: true, length: { minimum: 1 }
  validates :description, length: { minimum: 3 }
  validate :cannot_have_only_whitespace

  private

  def cannot_have_only_whitespace
    if description.length.positive? && !description.match?(/\S/)
      errors.add(:description, "cannot consist only of whitespaces")
      return false
    end
  end
end
