class Public::ReviewCommentsController < ApplicationController
  def create
    @comment = current_customer.review_comments.new(review_comment_params)
    if @comment.save
      flash[:notice] = "コメントを投稿しました"
    else
    end
    redirect_to review_path(params[:review_id])
  end

  def destroy
    @comment = ReviewComment.find(params[:id])
    @comment.destroy
    flash[:alert] = 'コメントを削除しました'
    redirect_to review_path(params[:review_id])
  end

  private

  def review_comment_params
    params.require(:review_comment).permit(:review_id, :comment)
  end
end
