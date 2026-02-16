class LeaderboardController < ApplicationController
  def index
    @players = Player.with_stats.order("wins_count DESC")
  end
end
