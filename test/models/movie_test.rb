require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "movie is valid with a title" do
    movie = Movie.new(title: "Parasite", director: Director.new(name: "Bong Joon-ho"))
    assert movie.title, "Parasite"
    assert movie.director, "Bong Joon-ho"
  end

  test "movie is not valid without a title" do
    movie = Movie.new(title: " ")
    assert_not movie.valid?
  end

  test 'can find what year a movie was released' do
    Movie.create(title: 'My Movie', year: '2020', director: Director.new(name: 'Kevin'))

    year = Movie.year_released('My Movie')

    assert_equal '2020', year
  end

  test 'finding a year for a movie that doesnt exist returns nil' do
    year = Movie.year_released('My Movie')

    assert_nil year
  end

  test 'can count movies by a minimum number of facebook likes' do
    Movie.create(title: 'The first movie', facebook_likes: 101, director: Director.new(name: 'Kevin'))
    Movie.create(title: 'The second movie', facebook_likes: 101, director: Director.new(name: 'Kevin'))
    Movie.create(title: 'The third movie', facebook_likes: 100, director: Director.new(name: 'Kevin'))
    Movie.create(title: 'The fourth movie', facebook_likes: 99, director: Director.new(name: 'Kevin'))

    likes = Movie.count_by_minimum_facebook_likes(100)

    assert_equal 2, likes
  end

  # Useful console queries for Exercise 3:
  # Movie.where("title like '%star trek%'").map { |movie| movie.facebook_likes }.sum
  # Movie.where("title like '%star wars%'").map(&:facebook_likes).sum # shorthand version using &: syntax
  # Movie.where("title like '%star wars%'").sum(:facebook_likes) # shortest version using rails' sum method
  #
  # or do it in ruby:
  # star_trek_movies = Movie.all.select { |movie| movie.title =~ /star trek/i }
  # star_trek_likes = star_trek_movies.map(&:facebook_likes).reduce(&:+)

  # One solution for Exercise 4 (see if you can find more!)
  #
  # movies_with_possible_train_keyword = Movie.where("plot_keywords like '%train'")
  # movies = movies_with_possible_train_keyword.select { |movie| movie.plot_keywords.split('|').include?('train') }
  # movies.map(&:title)

  test "creating a Movie sends a new movie email" do
    ActionMailer::Base.deliveries.clear

    Movie.create!(title: 'My Movie', director: Director.create!(name: 'Kevin Baribeau'))

    assert_operator ActionMailer::Base.deliveries.size, :>=, 1
  end
end
