class Place < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :photos
  
  geocoded_by :address
  after_validation :geocode
  
  validates :name, length: { minimum: 3 }
  validates :address, presence: true
  validates :description, presence: true

  def average_rating
    if comments.count == 0
      return "no ratings"
    end
    rating_integers = []
    comments.each do |c|
      rating_integers << c.rating.to_i
    end
    (rating_integers.sum.to_f / rating_integers.length).round(2)
  end
end
