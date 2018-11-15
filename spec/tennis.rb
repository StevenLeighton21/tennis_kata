class Tennis
  def initialize
    @player_1 = 0
    @player_2 = 0
  end

  def game_score
    case(@player_1)
    when 1
      p1 = '15'
    when 2
      p1 = '30'
    when 3
      p1 = '40'
    else
      p1 = '0'
    end

    case(@player_2)
    when 1
      p2 = '15'
    when 2
      p2 = '30'
    when 3
      p2 = '40'
    else
      p2 = '0'
    end

    "#{p1} - #{p2}"
  end

  def winner
    if @player_1 > @player_2
      'player1'
    else
      'nobody'
    end
  end

  def score_player1
    @player_1 = @player_1 += 1
  end

  def score_player2
    @player_2 = @player_2 += 1
  end

end
