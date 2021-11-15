class ReviewAuthor < ApplicationRecord
    has_many :reviews
    has_many :shows, :through => :reviews
    belongs_to :user
  end