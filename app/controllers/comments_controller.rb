class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def create
    if params[:sec] == ""
      params[:sec] = 0
    else
      params[:sec] = params[:sec].to_i
    end
    @comment = Comment.create(sec: params[:sec], sentence: params[:sentence], bookmark_id: params[:bookmark_id])
  end

  private

  # def comment_params
    # params.require(:comment).permit(:sec, :sentence, :bookmark_id)
  # end
end
