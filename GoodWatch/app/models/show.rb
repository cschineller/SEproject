class Show < ApplicationRecord
  has_many :reviews
  has_and_belongs_to_many :studios
  has_many :review_authors, :through => :reviews

  validates :title, presence: true
  validates :studio, presence: true
  validates :number_of_seasons, numericality: {greater_than_or_equal_to: 0}
  validates :year, numericality: {only_integer: true, greater_than_or_equal_to: 1000}
  validates :episodes, numericality: {only_integer: true, greater_than: 0}

  after_save :methodname

  def self.title_search(query)
    Show.where('title LIKE ?', "%#{query}%")
  end

  private

end