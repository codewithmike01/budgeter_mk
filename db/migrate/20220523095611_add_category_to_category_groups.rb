class AddCategoryToCategoryGroups < ActiveRecord::Migration[7.0]
  def change
    add_reference :category_groups, :category, null: false, foreign_key: true
  end
end
