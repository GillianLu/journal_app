class AddUserToCategories < ActiveRecord::Migration[7.1]
  def change
    add_reference :categories, :user, null: true, foreign_key: true
  end
end
