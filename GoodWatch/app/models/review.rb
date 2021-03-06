class Review < ApplicationRecord
    belongs_to :review_author
    belongs_to :show
    validates :stars, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  end