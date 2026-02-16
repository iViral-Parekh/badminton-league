require "rails_helper"

RSpec.describe LeaderboardQuery do
  describe ".call" do
    it "returns players ordered by wins" do
      player1 = create(:player)
      player2 = create(:player)

      create(:match, winner: player1, loser: player2)

      result = LeaderboardQuery.call

      expect(result.first.id).to eq(player1.id)
    end

    it "includes wins_count and losses_count" do
      player1 = create(:player)
      player2 = create(:player)

      create(:match, winner: player1, loser: player2)

      result = LeaderboardQuery.call.first

      expect(result.wins_count).to eq(1)
      expect(result.losses_count).to eq(0)
    end
  end
end
