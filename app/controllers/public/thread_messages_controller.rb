class Public::ThreadMessagesController < ApplicationController
  before_action :authenticate_admin_customer, only: [:destroy]
  before_action :authenticate_customer!, only: [:create]

  def index
    @customer = Customer.find(params[:customer_id])
    @messages = @customer.thread_messages.page(params[:page])
  end

  def create
    @thread = ThreadBoard.find(params[:thread_id])
    message = current_customer.thread_messages.new(thread_message_params)
    message.thread_board_id = @thread.id
    if message.save
      flash[:notice] = "メッセージを投稿しました"
    else
      flash[:alert] = "メッセージを入力してください"
    end
    @game = @thread.game
    @message = ThreadMessage.new
    @messages = @thread.thread_messages.page(params[:page])
    redirect_to request.referer
  end

  def destroy
    @thread = ThreadBoard.find(params[:thread_id])
    message = ThreadMessage.find(params[:id])
    message.destroy
    flash[:alert] = 'メッセージを削除しました'
    @game = @thread.game
    @message = ThreadMessage.new
    @messages = @thread.thread_messages.page(params[:page])
    redirect_to request.referer
  end

  private

  def thread_message_params
    params.require(:thread_message).permit(:thread_id, :message)
  end
end
