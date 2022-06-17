class Public::ThreadMessagesController < ApplicationController
  def index
    @thread_messages = ThreadMessage.where(customer_id: params[:customer_id])
  end

  def create
    @thread_message = ThreadMessage.new(thread_message_params)
    if @thread_message.save
      flash[:notice] = "メッセージを投稿しました"
    else
    end
    redirect_to thread_path(params[:thread_id])
  end

  def destroy
    @thread_message = ThreadMessage.find(params[:id])
    @thread_message.destroy
    flash[:alert] = 'メッセージを削除しました'
    redirect_to thread_path(params[:thread_id])
  end
end
