require "rails_helper"

RSpec.describe MatchRecorder do
  describe ".call" do
    it "creates a match" do
      winner = create(:player)
      loser = create(:player)

      expect {
        MatchRecorder.call(
          winner_id: winner.id,
          loser_id: loser.id
        )
      }.to change(Match, :count).by(1)
    end
  end
end
