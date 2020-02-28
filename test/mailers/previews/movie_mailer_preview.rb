# Preview all emails at http://localhost:3000/rails/mailers/movie_mailer
class MovieMailerPreview < ActionMailer::Preview
  def new_movie_email
    MovieMailer.with(movie: Movie.find(42)).new_movie_email
  end
end
