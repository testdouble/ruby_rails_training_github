require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "movie is valid with a title" do
    movie = Movie.new(title: "Parasite", director: "Bong Joon-ho")
    assert movie.title, "Parasite"
    assert movie.director, "Bong Joon-ho"
  end
end
