class MovieMailer < ApplicationMailer
  def new_movie_email
    @movie = params[:movie]
    mail(
      to: 'kevin@testdouble.com',
      from: 'themovieapp@example.com',
      subject: "New movie created: #{@movie.title}"
    )
  end
end
