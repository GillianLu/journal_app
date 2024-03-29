class Task < ApplicationRecord
  belongs_to :category
  validates :title, presence: true

  #USING scopes is better
  scope :today, -> { where(deadline: Date.today.all_day) }
  scope :tomorrow, -> {where(deadline: Date.tomorrow.beginning_of_day...2.days.from_now.beginning_of_day) } #this is called a lambda
  scope :this_week, -> {where(deadline: Date.today.beginning_of_day..1.week.from_now.end_of_day)}

  def toggle_completion
    self.completed = !completed
    save
  end
end
