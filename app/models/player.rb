class Player < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :wins,
           class_name: 'Match',
           foreign_key: :winner_id,
           dependent: :destroy

  has_many :losses,
           class_name: 'Match',
           foreign_key: :loser_id,
           dependent: :destroy

  scope :with_stats, lambda {
    select(
      "players.*,
       (SELECT COUNT(*) FROM matches WHERE winner_id = players.id) AS wins_count,
       (SELECT COUNT(*) FROM matches WHERE loser_id = players.id) AS losses_count"
    )
  }
end
