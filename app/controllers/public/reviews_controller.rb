class Public::ReviewsController < ApplicationController
  def index
    @reviews = Review.where(customer_id: params[:id])
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
    @game_id = params[:id]
  end

  def create
    @review = current_customer.reviews.new(review_params)
    if @review.save
      redirect_to review_path(@review), notice: "レビューを投稿しました"
    else
      render "new"
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review), notice: "レビューを更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @game = Game.find(@review.game_id)
    @review.destroy
    flash[:alert] = '選択したレビューを削除しました'
    redirect_to game_path(@game)
  end

  private

  def review_params
    params.require(:review).permit(:game_id, :rate, :comment, :is_public)
  end
end
