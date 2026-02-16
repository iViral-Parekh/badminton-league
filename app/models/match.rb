class Match < ApplicationRecord
  belongs_to :winner, class_name: 'Player'
  belongs_to :loser, class_name: 'Player'

  validate :winner_and_loser_must_be_different

  private

  def winner_and_loser_must_be_different
    if winner_id == loser_id
      errors.add(:loser, 'must be different from winner')
    end
  end
end
