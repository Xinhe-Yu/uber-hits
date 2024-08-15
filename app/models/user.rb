class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :reviews, through: :events
  has_one :fighter
  has_one_attached :photo

  validates :first_name, presence: true, length: { minimum: 1 }
  validate :validate_last_name
  validate :validate_description

  private

  def validate_description
    validate_field_cannot_have_only_whitespace(:description)
  end

  def validate_last_name
    validate_field_cannot_have_only_whitespace(:description, min_length: 1)
  end
end
