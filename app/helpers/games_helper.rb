module GamesHelper
  def participant_stats(game, game_stats, participant_no)
    case participant_no
      when :participant_1
        "#{game_stats[game.id][:participant_1_name]} (#{game_stats[game.id][:participant_1_score]})"
      when :participant_2
        "#{game_stats[game.id][:participant_2_name]} (#{game_stats[game.id][:participant_2_score]})"
    end
  end
end
