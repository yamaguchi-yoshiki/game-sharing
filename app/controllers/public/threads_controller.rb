class Public::ThreadsController < ApplicationController
  before_action :authenticate_admin_customer, only: [:new, :create]
  before_action :authenticate_admin!, only: [:destroy]
  before_action :ensure_guest_customer, only: [:new, :create]

  def index
    @game = Game.find(params[:game_id])
    @threads = @game.thread_boards
  end

  def show
    @thread = ThreadBoard.find(params[:id])
    @game = @thread.game
    @message = ThreadMessage.new
    @messages = @thread.thread_messages.page(params[:page])
  end

  def new
    @game = Game.find(params[:game_id])
    @thread = ThreadBoard.new
  end

  def create
    @thread = ThreadBoard.new(thread_params)
    if @thread.save
      redirect_to thread_path(@thread), notice: "スレッドを追加しました"
    else
      @game = Game.find(@thread.game_id)
      render "new"
    end
  end

  def destroy
    @thread = ThreadBoard.find(params[:id])
    @game_id = @thread.game_id
    @thread.destroy
    flash[:alert] = '選択したスレッドを削除しました'
    redirect_to game_threads_path(@game_id)
  end

  private

  def thread_params
    params.require(:thread_board).permit(:game_id, :title, :introduction, :no_spoiler)
  end

  def ensure_guest_customer
    if customer_signed_in?
      @customer = current_customer
      if @customer.email == "guest@example.com"
        redirect_to customer_path(@customer) , notice: 'ゲストユーザーはスレッドを追加できません。'
      end
    end
  end
end
