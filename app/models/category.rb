class Category < ApplicationRecord
  has_many :categorygroups, dependent: :destroy
  has_many :groups, through: :categorygroups

  validates :amount, presence: true
  validates :name, presence: true
end
