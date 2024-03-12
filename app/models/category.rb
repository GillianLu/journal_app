class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
