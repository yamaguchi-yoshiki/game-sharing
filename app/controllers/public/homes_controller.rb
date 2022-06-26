class Public::HomesController < ApplicationController
  def top
    @games = Game.latest.limit(5)
    @rank_games = Game.all.limit(5).sort { |a, b| b.reviews.average(:rate).to_f <=> a.reviews.average(:rate).to_f }
  end

  def about
  end
end
