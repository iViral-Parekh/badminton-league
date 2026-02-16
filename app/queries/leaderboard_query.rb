class LeaderboardQuery
  def self.call
    Player.order("wins_count DESC, losses_count ASC, players.name ASC")
  end
end
