class Public::GamesController < ApplicationController
  def index
    @games = Game.latest.page(params[:page])
  end

  def show
    @game = Game.find(params[:id])
    @reviews = @game.reviews
    @tags = @game.tags
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      thread_board = @game.thread_boards.new
      thread_board.title = "雑談(自動生成)"
      thread_board.introduction = "ゲームを追加すると自動で作られるスレッドです。
      雑談など自由にお使いください。(過度なネタバレはしないようにお願いします。)"
      thread_board.no_spoiler = true
      thread_board.save
      redirect_to game_path(@game), notice: "ゲームを追加しました"
    else
      render "new"
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to game_path(@game), notice: "ゲーム情報を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    flash[:alert] = '選択したゲームを削除しました'
    redirect_to games_path
  end

  private

  def game_params
    params.require(:game).permit(
      :platform_id,
      :title,
      :introduction,
      :release_date,
      :no_tax_price,
      :related_url
    )
  end
end
