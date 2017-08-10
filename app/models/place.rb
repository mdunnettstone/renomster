class Place < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  geocoded_by :address
  after_validation :geocode
  
  validates :name, length: { minimum: 3 }
  validates :address, presence: true
  validates :description, presence: true

  def avg_rating
    rating_vals = Comment.where(:place_id => @place).map do |c|
        c.rating.to_i
    end

    rating_vals.sum.to_f / rating_vals.length
  end
end
