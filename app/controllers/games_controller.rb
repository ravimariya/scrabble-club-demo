class GamesController < ApplicationController
  before_action :find_game, only: [:show, :edit, :update, :destroy]

  def index
    games = Game.all
    game_stats = {}

    games.each do |game|
      participants = game.participants.order_by_score
      game_stats[game.id] = {
        participant_1_name: participants.first.full_name,
        participant_1_score: participants.first.score,
        participant_2_name: participants.last.full_name,
        participant_2_score: participants.last.score,
        winner: "#{participants.first.full_name} (#{participants.first.score})"
      }
    end
    @games_data = [games, game_stats]
  end

  def new
    @game = Game.new
    2.times { @game.participants.build }
  end

  def edit; end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to games_path, notice: 'Game created successfully'
    else
      render :new
    end
  end

  def update
    if @game.update(game_params)
      redirect_to games_path, notice: 'Game updated successfully'
    else
      render :edit
    end
  end

  def destroy
    if @game.destroy
      redirect_to games_path, notice: 'Game deleted successfully'
    else
      redirect_to games_path
    end
  end

  private

  def find_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:title, :end_at, participants_attributes: [:id, :score, :result, :member_id])
  end
end
