class RemoveAuthorIdFromCategories < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :author_id, :integer
  end
end
