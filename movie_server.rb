require 'sinatra'
require 'sqlite3'

require_relative 'movies'

get '/' do
  # Just have a nice welcome page
end

post '/film' do
  # Search for a Movie
  # HINT - what is in params ?
  db = SQLite3::Database.new("movies.db")
  films = db.execute("select * from movies where title = 'Jaws'")
  if films.length > 0 	
  	puts "Cache HIT"
  	# Use the film info from the database
  else
  	puts "Cache MISS"

  	# Lookup the film information on the web
    film = Movie.get_film_info("jaws")

    # store the film in the database
    film.save
  end
  # Display the movie in the page
end