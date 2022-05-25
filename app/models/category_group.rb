class CategoryGroup < ApplicationRecord
  belongs_to :category
  belongs_to :group
end
