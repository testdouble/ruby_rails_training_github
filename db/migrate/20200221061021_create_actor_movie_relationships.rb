class CreateActorMovieRelationships < ActiveRecord::Migration[6.0]
  def change
    create_join_table :actors, :movies, table_name: :actor_movie_relationships
  end
end
