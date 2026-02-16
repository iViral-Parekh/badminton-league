class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :destroy]

  def index
    @players = Player.order(:name)
  end

  def show
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to players_path, notice: "Player created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @player.destroy
    redirect_to players_path, notice: "Player deleted successfully."
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:name)
  end
end
