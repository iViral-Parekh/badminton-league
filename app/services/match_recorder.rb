class MatchRecorder
  attr_reader :winner_id, :loser_id

  def self.call(params)
    new(params).call
  end

  def initialize(params)
    @winner_id = params[:winner_id]
    @loser_id = params[:loser_id]
  end

  def call
    return { success: false, error: "Winner and loser cannot be same" } if winner_id == loser_id

    Match.transaction do
      create_match
    end
    
    { success: true }
  rescue ActiveRecord::RecordInvalid => e
    { success: false, error: e.record.errors.full_messages.join(", ") }
  end

  private

  def create_match
    Match.create!(
      winner_id: winner_id,
      loser_id: loser_id
    )
  end
end
