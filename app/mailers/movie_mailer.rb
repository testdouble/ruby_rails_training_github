class MovieMailer < ApplicationMailer
  def new_movie_email
    movie = params[:movie]
    mail(
      to: 'kevin@testdouble.com',
      subject: "New movie created: #{movie.title}"
    )
  end
end
