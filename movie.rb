class Movie < ActiveRecord::Base
  def self.get_film_info(name)
    imdb_data = HTTParty.get("http://www.omdbapi.com/?t=#{name}")
    movie_info = JSON(imdb_data)
    # Create a Movie object...
    m = Movie.new
    m.title = movie_info["Title"]
    m.year = movie_info["Year"]
    m.save
    # m.reload
    # Fill in the attributes...

    # Store me in a database...
  end

end