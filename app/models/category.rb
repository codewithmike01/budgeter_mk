class Category < ApplicationRecord
  has_many :categorygroups, dependent: :destroy
  has_many :groups, through: :categorygroups

  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, presence: true
end
