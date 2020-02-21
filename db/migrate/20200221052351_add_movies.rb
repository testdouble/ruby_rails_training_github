class AddMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :facebook_likes
      t.string :imdb_link
      t.string :plot_keywords
      t.integer :year
    end
  end
end
