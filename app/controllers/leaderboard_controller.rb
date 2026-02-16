class LeaderboardController < ApplicationController
  def index
    @players = LeaderboardQuery.call.page(params[:page])
  end
end
