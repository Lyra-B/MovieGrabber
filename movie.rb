class Movie < ActiveRecord::Base
  def self.get_film_info(name)
    # Create a Movie object...
    #binding.pry
    if Movie.find_by_title(name)==nil
        #binding.pry
    imdb_data = HTTParty.get("http://www.omdbapi.com/?t=#{name}")
    movie_info = JSON(imdb_data)
    m = Movie.new
    m.title = movie_info["Title"]
    m.year = movie_info["Year"]
    m.save
    m
    end
    # m.reload
    # Fill in the attributes...

    # Store me in a database...
  end

end