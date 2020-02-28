require 'test_helper'

class MovieMailerTest < ActionMailer::TestCase
  test "the new movie email tells us about the movie" do
    director = Director.new(name: 'Kevin Baribeau')
    movie = Movie.create(title: 'My Movie', director: director)
    email = MovieMailer.with(movie: movie).new_movie_email

    assert_emails 1 do
      email.deliver_now
    end
  end
end
