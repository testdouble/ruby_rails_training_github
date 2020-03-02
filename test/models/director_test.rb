# test/models/director_test.rb

require 'test_helper'

class DirectorTest < ActiveSupport::TestCase
  test "director has a name and age" do
    director = create(:director)

    assert director.movies.count, 0

    movies = create_list(:movie, 3, director: director)

    assert director.movies.count, 2
  end
end
