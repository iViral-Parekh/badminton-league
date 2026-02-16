require "rails_helper"

RSpec.describe Match, type: :model do
  it "is valid with different winner and loser" do
    match = create(:match)

    expect(match).to be_valid
  end

  it "is invalid with same winner and loser" do
    player = create(:player)

    match = Match.new(
      winner: player,
      loser: player
    )

    expect(match).not_to be_valid
  end
end
