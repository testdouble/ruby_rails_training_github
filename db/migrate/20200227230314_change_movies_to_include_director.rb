class ChangeMoviesToIncludeDirector < ActiveRecord::Migration[6.0]
  def up
    add_reference :movies, :director, foreign_key: true
    Movie.all.each do |movie|

      # Since we've added `belongs_to :director` to movie, the .director
      # method points to a relation now, and not the name of the director!
      # read_attribute is a way to get at the actual director's name
      director_name = movie.read_attribute(:director)

      unless Director.exists?(name: director_name)
        director = Director.create!(
          name: director_name,
        )
      end

      movie.update(director_id: Director.find_by(name: director_name).id)
    end

    remove_column :movies, :director, :string
  end

  def down
    add_column :movies, :director, :string

    Movie.includes(:director).all.each do |movie|
      movie.update_columns(director: movie.director&.name)
    end

    remove_column :movies, :director_id

    Director.delete_all
  end
end
