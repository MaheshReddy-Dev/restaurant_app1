class Dish < ApplicationRecord
  belongs_to :restaurant
  validates :name, presence: true
  validates :price, presence: true, numericality: true
  has_many :reviews, as: :reviewable, dependent: :destroy

  def average_rating
    reviews.average(:rating)
end

end
