class Movie < ApplicationRecord
  has_many :actor_movie_relationships
  has_many :actors, through: :actor_movie_relationships
end
