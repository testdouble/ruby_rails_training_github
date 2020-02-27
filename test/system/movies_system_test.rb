# test/system/movies_system_test.rb

require "application_system_test_case"

class MoviesSystemTest < ApplicationSystemTestCase
  test "visiting the show" do
    attributes = { title: "Parasite", director: 'Bong Joon-ho' }
    movie = Movie.create(attributes)

    # As a user,
    # when I visit /movies/1
    visit "/movies/#{movie.id}"
    # I see the title of the movie "Parasite"
    assert_text "Parasite"
    # I also see the name of the director "Bong Joon-ho"
    assert_text "Bong Joon-ho"
  end

  test "visiting the show for another movie" do
    attributes = { title: "Titanic", director: 'James Cameron' }
    movie = Movie.create(attributes)

    visit "/movies/#{movie.id}"

    assert_text "Titanic"
    assert_text "James Cameron"
  end
end
