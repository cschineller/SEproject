class Show < ApplicationRecord
  has_many :reviews
  has_and_belongs_to_many :titles
  has_many :review_authors, :through => :reviews

  validates :title, presence: true
  validates :creator, presence: true
  validates :number_of_seasons, numericality: {greater_than_or_equal_to: 0}
  validates :year, numericality: {only_integer: true, greater_than_or_equal_to: 1000}
  validates :episodes, numericality: {only_integer: true, greater_than: 0}

  
  def self.title_search(query)
    Show.where('title LIKE ?', "%#{query}%")
  end

  def average_rating
    reviews.average(:stars)
  end

  private

end