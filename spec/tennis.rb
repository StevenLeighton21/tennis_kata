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
    when 4
      p1 = 'Advantage'
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
    when 4
      p2 = 'Advantage'
    else
      p2 = '0'
    end

    if p1 == 'Advantage' && p2 == 'Advantage'
      @player_1 = 3
      @player_2 = 3
      return game_score
    end

    "#{p1} - #{p2}"
  end

  def winner
    if(@player_1 == 5 && @player_2 <= 3)
      return 'player1'
    end

    if @player_1 - @player_2 >= 3
      return 'player1'
    end
    else if @player_2 - @player_1 >= 3
      return 'player2'
    end
      'nobody'

  end

  def score_player1
    @player_1 = @player_1 += 1
  end

  def score_player2
    @player_2 = @player_2 += 1
  end

end
