class Public::ThreadsController < ApplicationController
  def index
    @thread = ThreadBoard.where(game_id: params[:id])
  end

  def show
    @thread = ThreadBoard.find(params[:id])
  end

  def new
    @thread = ThreadBoard.new
    @game_id = params[:id]
  end

  def create
    @thread = ThreadBoard.new(thread_params)
    if @thread.save
      redirect_to thread_path(@thread), notice: "スレッドを追加しました"
    else
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
end
