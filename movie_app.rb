require 'sinatra'
require 'sqlite3'
require 'pry'
require 'httparty'
require 'active_record'
require_relative 'movie'
#require_relative './helper'
#require_relative 'active_record'

configure do
  db_config = YAML.load_file('db/config.yml')["development"]

  ActiveRecord::Base.establish_connection(
    :adapter => db_config["adapter"],
    :database => db_config["database"]
  )
end

get '/' do
  erb :homepage
end

post '/film' do
	if params[:name] == ""
		redirect '/'
	else
		#binding.pry
		film = params[:name]
		Movie.get_film_info(film)
		#[200, {}, get_film_info(film)]
		#get '/film'
		#film = Movie.get_film_info(params[:name])
		#binding.pry
  end
  # Search for a Movie
  # HINT - what is in params ?
  
  #binding.pry

  # Lookup the film information on the web
  #film = Movie.get_film_info("jaws")

  # store the film in the database

  # Display the movie in the page
end
