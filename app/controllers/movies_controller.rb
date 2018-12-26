class MoviesController < ActionController::API
    def index
      render json: movie_item_collection
    end
    private
    def movie_item_collection
      MovieItem.all
    end
  
end