class User < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :tasks, through: :categories

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end


#current_user.tasks

# SELECT tasks.*
# FROM tasks
# INNER JOIN categories
# ON tasks.category_id = categories.id
# WHERE categories.user_id = 3
