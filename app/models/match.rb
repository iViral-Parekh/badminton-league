class Match < ApplicationRecord
  belongs_to :winner, class_name: "Player", counter_cache: :wins_count
  belongs_to :loser, class_name: "Player", counter_cache: :losses_count

  validate :winner_and_loser_must_be_different

  private

  def winner_and_loser_must_be_different
    if winner_id == loser_id
      errors.add(:loser, "must be different from winner")
    end
  end
end
