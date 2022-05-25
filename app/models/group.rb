class Group < ApplicationRecord
  has_many :categorygroups, dependent: :destroy
  has_many :categories, through: :categorygroups, dependent: :destroy

  # Validation of inputs
  validates :icon, presence: true
  validates :name, presence: true

  def self.total_spending(group_id)
    sum = 0
    category_groups = CategoryGroup.all
    category_groups.each do |cat_group|
      next unless cat_group.group_id == group_id.to_i

      categories = Category.where(id: cat_group.category_id)
      categories.each do |category|
        sum += category.amount.to_i
      end
    end
    sum
  end
end
