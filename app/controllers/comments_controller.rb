class CommentsController < ApplicationController
  after_action :touch_bookmark, only: [:create, :destroy]

  def index
  end

  def show
  end

  def create
    params[:sec] = params[:sec].to_i
    @comment = Comment.create(sec: params[:sec], sentence: params[:sentence], bookmark_id: params[:bookmark_id])
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
  end

  private

  def touch_bookmark
    Bookmark.find(params[:bookmark_id]).touch
  end
  # def comment_params
    # params.require(:comment).permit(:sec, :sentence, :bookmark_id)
  # end
end

