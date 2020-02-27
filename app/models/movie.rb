class Movie < ApplicationRecord
  validates_presence_of :title

  def self.year_released(title)
    Movie.find_by(title: title)&.year
  end
end
