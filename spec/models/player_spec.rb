require "rails_helper"

RSpec.describe Player, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      player = build(:player)
      expect(player).to be_valid
    end

    it "is invalid without name" do
      player = Player.new(name: nil)
      expect(player).not_to be_valid
    end

    it "does not allow duplicate names" do
      create(:player, name: "John")

      duplicate = Player.new(name: "John")

      expect(duplicate).not_to be_valid
    end
  end

  describe "associations" do
    it "can have wins" do
      player = create(:player)
      opponent = create(:player)

      create(:match, winner: player, loser: opponent)

      expect(player.wins.count).to eq(1)
    end

    it "can have losses" do
      player = create(:player)
      opponent = create(:player)

      create(:match, winner: opponent, loser: player)

      expect(player.losses.count).to eq(1)
    end
  end
end
