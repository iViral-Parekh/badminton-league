class LeaderboardQuery
  def self.call
    Player
      .left_joins(:wins, :losses)
      .select(
        "players.*,
         (SELECT COUNT(*) FROM matches WHERE winner_id = players.id) AS wins_count,
         (SELECT COUNT(*) FROM matches WHERE loser_id = players.id) AS losses_count"
      )
      .group("players.id")
      .order("wins_count DESC, losses_count ASC, players.name ASC")
  end
end
