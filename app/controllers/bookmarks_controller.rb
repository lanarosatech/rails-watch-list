class BookmarksController < ApplicationController
  # before_action :set_bookmark, only: [:new, :create, :destroy]

  # def index
  #   @bookmarks = Bookmark.all
  # end

  # def show
  #   @bookmark = Bookmark.find(params[:id])
  # end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(list_params)
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
  end

  private

  # def set_bookmark
  #   @bookmarks = Bookmarks.find(params[:id])
  # end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end
