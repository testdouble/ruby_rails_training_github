require "application_system_test_case"

class MoviesSystemTest < ApplicationSystemTestCase
  test "visiting the show" do
    director = Director.create(name: "Bong Joon-ho")
    attributes = { title: "Parasite", director: director }
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
    director = Director.create(name: "James Cameron")
    attributes = { title: "Titanic", director: director }
    movie = Movie.create(attributes)

    visit "/movies/#{movie.id}"
    assert_text "Titanic"
    assert_text "James Cameron"
  end

  test "visiting the show for yet another movie" do
    movie = create(:movie)

    visit "/movies/#{movie.id}"

    assert_text movie.title
    assert_text movie.director.name
  end
end
