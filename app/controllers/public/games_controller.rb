class Public::GamesController < ApplicationController
  def index
    @games = Game.latest.page(params[:page])
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
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

  def platform_params
    params.require(:platform).permit(
      :platform_id,
      :title,
      :introduction,
      :release_date,
      :no_tax_price,
      :related_url
    )
  end
end
