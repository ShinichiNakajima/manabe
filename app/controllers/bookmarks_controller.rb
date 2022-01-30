class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookmark = Bookmark.new
  end

  def create
    # 空の入力ならトップページへ。
    url = params[:bookmark][:url]
    if url.empty? || url.index("youtu") == nil
      redirect_to root_path
      return
    end

    url_id = extract_id(url)

    # 短縮URLなら通常のURLに変換
    if url.index("youtu.be")
      url = "https://www.youtube.com/watch?v=" + url_id
    end

    # 入力されたURLが既にあればそのページへ転送、
    Bookmark.all.each do |bookmark|
      if bookmark[:url] == url_id && bookmark.user.id == current_user.id
        redirect_to bookmark_path(bookmark.id)
        return
      end
    end
    # 新規ならBookmarkテーブルへ登録後動画視聴ページへ。
    title = get_title(url)
    @bookmark = Bookmark.new(bookmark_params(title))
    @bookmark.save
    redirect_to bookmark_path(@bookmark.id)
  end

  def show
    @bookmark_id = params[:id]
    if Bookmark.find(@bookmark_id).user.id != current_user.id
      redirect_to root_path
    else
      @comment = Comment.new
    end
  end

  def destroy
    bookmark = Bookmark.find(params[:id])
    bookmark.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def get_title (url)
    require "open-uri"
    html = URI.open(url).read
    return html.slice(html.index("<title>")+7...html.index("- YouTube</title>")).strip
  end

  def bookmark_params (title)
    params[:bookmark][:url] = extract_id(params[:bookmark][:url])
    params.require(:bookmark).permit(:url).merge(user_id: current_user.id, title: title)
  end

  def extract_id (url)
    if url.index("youtu.be")
      return url.slice((url.index("be/")+3)...url.length).sub("/", "")
    else
      return url.slice((url.index("v=")+2)...url.index("&"))
    end
  end

end
