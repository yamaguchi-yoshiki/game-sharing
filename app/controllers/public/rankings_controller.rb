class Public::RankingsController < ApplicationController
  def index
    @games = Game.order(reviews.average(:rate)).page(params[:page])
    @platforms = Platform.all
    @tags = Tag.all
  end

  def search
    @platforms = Platform.all
    @tags = Tag.all
    if params[:word]
      @word = params[:word]
      @total_games = Game.where("title LIKE?","%#{@word}%")
      @games = @total_games.latest.page(params[:page])
    elsif params[:type] == "platform"
      @word = params[:commit]
      @platform = Platform.find_by(name: @word)
      @total_games = Game.where(platform_id: @platform.id)
      @games = @total_games.latest.page(params[:page])
    elsif params[:type] == "tag"
      @word = params[:commit]
      @tag = Tag.find_by(name: @word)
      @total_games = @tag.games
      @games = @total_games.latest.page(params[:page])
    end
    render "index"
  end
end
