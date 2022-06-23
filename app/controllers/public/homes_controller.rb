class Public::HomesController < ApplicationController
  def top
    @games = Game.latest.limit(5)
    @rank_games = Game.all.sort { |a, b| b.reviews.average(:rate).to_f <=> a.reviews.average(:rate).to_f }.limit(5)
  end

  def about
  end
end
