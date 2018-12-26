class CreateMovieItems < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_items do |t|
      t.string :adult
      t.string :backdrop_path
      t.string :original_language
      t.string :original_title
      t.string :overview
      t.string :poster_path
      t.string :release_date
      t.string :title
	  t.timestamps
    end
  end
end
