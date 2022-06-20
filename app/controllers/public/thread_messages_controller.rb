class Public::ThreadMessagesController < ApplicationController
  def index
    @messages = ThreadMessage.where(customer_id: params[:customer_id])
  end

  def create
    @tmessage = current_customer.thread_messages.new(thread_message_params)
    if @message.save
      flash[:notice] = "メッセージを投稿しました"
    else
    end
    redirect_to thread_path(params[:thread_id])
  end

  def destroy
    @message = ThreadMessage.find(params[:id])
    @message.destroy
    flash[:alert] = 'メッセージを削除しました'
    redirect_to thread_path(params[:thread_id])
  end

  private

  def thread_message_params
    params.require(:thread_message).permit(:thread_id, :message)
  end
end
