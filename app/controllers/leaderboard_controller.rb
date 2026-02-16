class LeaderboardController < ApplicationController
  def index
    @players = LeaderboardQuery.call
  end
end
