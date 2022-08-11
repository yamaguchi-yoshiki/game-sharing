class Public::ReviewCommentsController < ApplicationController
  before_action :authenticate_admin_customer, only: [:destroy]
  before_action :authenticate_customer!, only: [:create]

  def create
    comment = current_customer.review_comments.new(review_comment_params)
    review_id = comment.review.id
    if comment.save
      flash[:notice] = "コメントを投稿しました"
    else
      flash[:alert] = "コメントを入力してください"
    end
    @review = Review.find(review_id)
    @comment = ReviewComment.new
    @comments = @review.review_comments
    redirect_to request.referer
  end

  def destroy
    comment = ReviewComment.find(params[:id])
    review_id = comment.review.id
    comment.destroy
    flash[:alert] = 'コメントを削除しました'
    @review = Review.find(review_id)
    @comment = ReviewComment.new
    @comments = @review.review_comments
    redirect_to request.referer
  end

  private

  def review_comment_params
    params.require(:review_comment).permit(:review_id, :comment)
  end
end
