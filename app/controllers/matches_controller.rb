class MatchesController < ApplicationController
  before_action :load_players, only: [ :new, :create ]

  def index
    @matches = Match.includes(:winner, :loser)
                    .order(created_at: :desc)
  end

  def new
    @match = Match.new
  end

  def create
    MatchRecorder.call(match_params)

    redirect_to matches_path, notice: "Match recorded successfully."
  rescue ActiveRecord::RecordInvalid => e
    @match = e.record
    render :new, status: :unprocessable_entity
  end

  private

  def load_players
    @players = Player.order(:name)
  end

  def match_params
    params.require(:match).permit(:winner_id, :loser_id)
  end
end
