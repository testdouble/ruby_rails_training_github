require 'csv'

namespace :import_data do
  desc 'import data from vendor/movie_metadata.csv'
  task run: :environment do
    CSV.parse(File.open('vendor/movie_metadata.csv', 'r'), headers: true).each do |row|
      movie = Movie.new(
        title: row['movie_title'],
        facebook_likes: row['movie_facebook_likes'],
        imdb_link: row['movie_imdb_link'],
        year: row['title_year'],
        plot_keywords: row['plot_keywords'],
      )
      movie.save

      [1, 2, 3].each do |i|
        actor_name = row["actor_#{i}_name"]
        actor_facebook_likes = row["actor_#{i}_facebook_likes"]

        unless Actor.exists?(name: actor_name)
          Actor.new(
            name: actor_name,
            facebook_likes: actor_facebook_likes,
          ).save
        end

        actor = Actor.find_by(name: actor_name)
        ActorMovieRelationship.new(
          actor: actor,
          movie: movie,
        ).save
      end
    end
  end
end
