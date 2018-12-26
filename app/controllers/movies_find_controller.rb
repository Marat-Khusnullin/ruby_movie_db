class MoviesFindController < ActionController::API
    def index
      render json: movie_item_collection
    end
    private
    def movie_item_collection
      MovieItem.where("LOWER(title) ILIKE '%#{params[:query].downcase}%'")
    end
  
end