require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "movie is valid with a title" do
    movie = Movie.new(title: "Parasite", director: "Bong Joon-ho")
    assert movie.title, "Parasite"
    assert movie.director, "Bong Joon-ho"
  end

  test "movie is not valid without a title" do
    movie = Movie.new(title: " ")
    assert_not movie.valid?
  end
end
