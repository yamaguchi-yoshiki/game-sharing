class Public::ThreadMessagesController < ApplicationController
  before_action :authenticate_admin_customer, only: [:destroy]
  before_action :authenticate_customer!, only: [:create]

  def index
    @customer = Customer.find(params[:customer_id])
    @messages = @customer.thread_messages.page(params[:page])
  end

  def create
    @thread = ThreadBoard.find(params[:thread_id])
    @message = current_customer.thread_messages.new(thread_message_params)
    @message.thread_board_id = @thread.id
    if @message.save!
      flash[:notice] = "メッセージを投稿しました"
    else
      flash[:alert] = "error"
    end
    redirect_to thread_path(@thread)
  end

  def destroy
    @thread = ThreadBoard.find(params[:thread_id])
    @message = ThreadMessage.find(params[:id])
    @message.destroy
    flash[:alert] = 'メッセージを削除しました'
    redirect_to thread_path(@thread)
  end

  private

  def thread_message_params
    params.require(:thread_message).permit(:thread_id, :message)
  end
end
