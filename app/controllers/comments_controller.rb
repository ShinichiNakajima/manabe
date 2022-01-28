class CommentsController < ApplicationController
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

  # def comment_params
    # params.require(:comment).permit(:sec, :sentence, :bookmark_id)
  # end
end

