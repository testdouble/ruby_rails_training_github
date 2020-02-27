class Movie < ApplicationRecord
  validates_presence_of :title
  belongs_to :director

  def self.year_released(title)
    Movie.find_by(title: title)&.year
  end

  def self.count_by_minimum_facebook_likes(facebook_likes)
    Movie.where('facebook_likes > ?', facebook_likes).count
  end
end
