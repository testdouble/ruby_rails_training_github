require 'test_helper'

class MovieMailerTest < ActionMailer::TestCase
  test "the new movie email tells us about the movie" do
    director = Director.new(name: 'Kevin Baribeau')
    movie = Movie.create(title: 'My Movie', director: director)
    email = MovieMailer.with(movie: movie).new_movie_email

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['kevin@testdouble.com'], email.to
    assert_equal ['themovieapp@example.com'], email.from
    assert_match /My Movie/, email.subject
    assert_match /My Movie/, email.body.to_s
    assert_match /Kevin Baribeau/, email.body.to_s
  end
end
