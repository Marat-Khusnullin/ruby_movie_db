require "crypto-news-api"
require "pry"
require "open-uri"
require "json"
require_relative '/home/marat/Desktop/storage_example-master/app/models/movie_item_for_fun.rb'
 
desc "Fetch news"
task fetch: :environment do
  response = open("https://api.themoviedb.org/3/trending/movie/week?api_key=f3e3540940d267810c211e8fafd2edc2").read
  data = JSON.parse(response)
  films  = data['results'].map {|rd| MovieItemForFun.new(rd['adult'], rd['backdrop_path'], rd['original_language'], rd['original_title'], rd['poster_path'], rd['release_date'], rd['title'])}
  films.each do |article|
    MovieItem.create(
      adult: article.adult,
      backdrop_path: article.backdrop_path,
      original_language: article.original_language,
      original_title: article.original_title,
      poster_path: article.poster_path,
      release_date: article.release_date,
      title: article.title
    )
  end
end
