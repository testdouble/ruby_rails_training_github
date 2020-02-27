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

  test 'can find what year a movie was released' do
    Movie.create(title: 'My Movie', year: '2020')

    year = Movie.year_released('My Movie')

    assert_equal '2020', year
  end

  test 'finding a year for a movie that doesnt exist returns nil' do
    year = Movie.year_released('My Movie')

    assert_nil year
  end
end
