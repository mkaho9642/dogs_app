class Admin::GenresController < ApplicationController
  layout 'admin'
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
