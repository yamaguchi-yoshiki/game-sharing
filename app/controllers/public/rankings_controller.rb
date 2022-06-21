class Public::RankingsController < ApplicationController
  def index
    sort_games = Game.all.sort { |a, b| b.reviews.average(:rate).to_f <=> a.reviews.average(:rate).to_f }
    @games = Kaminari.paginate_array(sort_games).page(params[:page])
    @platforms = Platform.all
    @tags = Tag.all
  end

  def search
    @platforms = Platform.all
    @tags = Tag.all
    if params[:word]
      @word = params[:word]
      @total_games = Game.where("title LIKE?","%#{@word}%")
      sort_games = @total_games.sort { |a, b| b.reviews.average(:rate).to_f <=> a.reviews.average(:rate).to_f }
      @games = Kaminari.paginate_array(sort_games).page(params[:page])
    elsif params[:type] == "platform"
      @word = params[:commit]
      @platform = Platform.find_by(name: @word)
      @total_games = Game.where(platform_id: @platform.id)
      sort_games = @total_games.sort { |a, b| b.reviews.average(:rate).to_f <=> a.reviews.average(:rate).to_f }
      @games = Kaminari.paginate_array(sort_games).page(params[:page])
    elsif params[:type] == "tag"
      @word = params[:commit]
      @tag = Tag.find_by(name: @word)
      @total_games = @tag.games
      sort_games = @total_games.sort { |a, b| b.reviews.average(:rate).to_f <=> a.reviews.average(:rate).to_f }
      @games = Kaminari.paginate_array(sort_games).page(params[:page])
    end
    render "index"
  end
end
