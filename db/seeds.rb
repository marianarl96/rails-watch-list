require 'open-uri'
require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
movie_num = 0

Movie.destroy_all
10.times do
  url = "https://api.themoviedb.org/3/movie/top_rated?api_key=68f2be6f58f038faa125bc9358b5b958"
  movie_serialized = URI.open(url).read
  movie = JSON.parse(movie_serialized)
  Movie.create(title: movie['results'][movie_num]['title'], overview: movie['results'][movie_num]['overview'], poster_url: movie['results'][movie_num]['poster_path'], rating: movie['results'][movie_num]['vote_average'])
  movie_num += 1
end
