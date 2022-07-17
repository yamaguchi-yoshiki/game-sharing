class Public::SympathiesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    sympathy = current_customer.sympathies.new(review_id: @review.id)
    sympathy.save
    redirect_to request.referer
  end

  def destroy
    @review = Review.find(params[:review_id])
    sympathy = current_customer.sympathies.find_by(review_id: @review.id)
    sympathy.destroy
    redirect_to request.referer
  end
end
