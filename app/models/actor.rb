class Actor < ApplicationRecord
  has_many :actor_movie_relationships
  has_many :movies, through: :actor_movie_relationships
end
