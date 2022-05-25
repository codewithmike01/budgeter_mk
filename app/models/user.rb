class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  #  Validation of input
  validates :name, presence: true
  validates :email, presence: true

  has_many :categories, dependent: :destroy
  has_many :groups, dependent: :destroy
end
