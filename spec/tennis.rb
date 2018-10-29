class Tennis
  def initialize
    @player_1 = 0
    @player_2 = 0
  end

  def game_score
    "#{@player_1} - #{@player_2}"
  end

  def score_player1
    @player_1 += 15
  end

  def score_player2
    @player_2 += 15
  end


end
