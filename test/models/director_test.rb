# test/models/director_test.rb
require 'test_helper'

class DirectorTest < ActiveSupport::TestCase
  test "director has a name and age" do
    director = create(:director)
 
    # assert director.name,
    # assert director.age, 50
    assert director.movies.count, 0

    Movie.create(title: "Snowpiercer", facebook_likes: 70, plot_keywords: "snow|train", year: 2013, director: director)
    Movie.create(title: "The Host", facebook_likes: 170, plot_keywords: "daughter|monster", year: 2006, director: director)
    
    # director.movies.create(title: "Snowpiercer", facebook_likes: 70, plot_keywords: "snow|train", year: 2013)
    # director.movies.create(title: "The Host", facebook_likes: 170, plot_keywords: "daughter|monster", year: 2006)

    # movie_1 = Movie.create(title: "Snowpiercer", facebook_likes: 70, plot_keywords: "snow|train", year: 2013)
    # movie_2 = Movie.create(title: "The Host", facebook_likes: 170, plot_keywords: "daughter|monster", year: 2006)
    # director.movies << [movie_1, movie_2]

    assert director.movies.count, 2
  end
end
