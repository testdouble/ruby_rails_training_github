class ActorMovieRelationship < ApplicationRecord
  belongs_to :actor
  belongs_to :movie
end
