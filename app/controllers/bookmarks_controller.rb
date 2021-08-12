class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]
  # before_action :set_movie, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    # @bookmark.movie = @movie
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  # def set_movie
  #   @movie = Movie.find(params[:movie_id])
  # end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
