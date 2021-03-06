class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def new
  end

  def create
    new_director = Director.create!(
      name: params[:movie][:director][:name],
    )
    new_movie = Movie.create!(
      movie_form_params.merge(
        director: new_director,
      ),
    )

    flash[:notice] = "Movie #{new_movie.title} created successfully!"
    redirect_to movie_path(new_movie.id)
  end

  def update
    Movie.find(params[:id]).update(movie_form_params)
  end

  private

  def movie_form_params
    params.require(:movie).permit(:title, :director, :plot_keywords, :facebook_likes, :year)
  end
end
