class Movie < ApplicationRecord
  validates_presence_of :title
  belongs_to :director
  enum color_format: [:color, :black_and_white]

  after_create :send_new_movie_email

  def self.year_released(title)
    Movie.find_by(title: title)&.year
  end

  def self.count_by_minimum_facebook_likes(facebook_likes)
    Movie.where('facebook_likes > ?', facebook_likes).count
  end

  private

  def send_new_movie_email
    MovieMailer.with(movie: self).new_movie_email.deliver_now
  end
end
