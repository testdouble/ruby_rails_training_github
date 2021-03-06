require "application_system_test_case"

class MoviesSystemTest < ApplicationSystemTestCase
  test "visiting the show" do
    movie = create(:movie)

    visit movie_path(movie)

    assert_text movie.title
    assert_text movie.director.name
  end
end
