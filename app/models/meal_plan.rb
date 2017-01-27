class MealPlan < ApplicationRecord
  belongs_to :user
  has_many :meals, -> { order(:date) }, inverse_of: :meal_plan, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user, presence: true

  accepts_nested_attributes_for :meals

  def build_meals
    user_recipe_ids = user.recipes.pluck(:id)
    (start_date..end_date).each do |date|
      
      unused_recipe_ids = user_recipe_ids - meals.map(&:recipe_id)
      available_recipes_ids = unused_recipe_ids.empty? ? user_recipe_ids : unused_recipe_ids
      meals.build(date: date, recipe_id: available_recipes_ids.sample)
    end
  end

  def to_s
    "#{I18n.localize(start_date)} - #{I18n.localize(end_date)}"
  end
end