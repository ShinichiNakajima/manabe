class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookmark = Bookmark.new
  end

  def create
    url = params[:bookmark][:url]
    if url.empty? || url.index("youtube") == nil
      redirect_to root_path
    else
      title = get_title(url)
      @bookmark = Bookmark.new(bookmark_params(title))
      Bookmark.all.each do |bookmark|
        if bookmark[:url] == @bookmark.url && bookmark.user.id == current_user.id
          redirect_to root_path
          return
        end
      end
      @bookmark.save
      redirect_to bookmark_path(@bookmark.id)
    end
  end

  def show
    @bookmark_id = params[:id]
    if Bookmark.find(@bookmark_id).user.id != current_user.id
      redirect_to root_path
    else
      @comment = Comment.new
    end
  end

  private

  def get_title (url)
    require "open-uri"
    html = URI.open(url).read
    return html.slice(html.index("<title>")+7...html.index("- YouTube</title>")).strip
  end

  def bookmark_params (title)
    p = params[:bookmark][:url]
    params[:bookmark][:url] = p.slice((p.index("v=")+2)...p.index("&"))
    params.require(:bookmark).permit(:url).merge(user_id: current_user.id, title: title)
  end

end
