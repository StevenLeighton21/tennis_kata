require 'tennis'

describe Tennis do
  subject { described_class.new }

  it 'should start a game with no score' do
    expect(subject.game_score).to eq('0 - 0')
  end

  it 'should allow player 1 to score' do
    subject.score_player1
    expect(subject.game_score).to eq('15 - 0')
  end

  it 'should allow player 2 to score' do
    subject.score_player2
    expect(subject.game_score).to eq('0 - 15')
  end

  it 'should allow players to each score once' do
    subject.score_player1
    subject.score_player2

    expect(subject.game_score).to eq('15 - 15')
  end

  it 'should allow player1 to pull ahead in an even game' do
    subject.score_player2
    2.times { subject.score_player1 }

    expect(subject.game_score).to eq('30 - 15')
  end

  it 'should allow player2 to pull ahead' do
    2.times { subject.score_player1 }
    2.times { subject.score_player2 }

    expect(subject.game_score).to eq('30 - 30')
  end

  it 'should allow player1 to go to 40' do
    3.times { subject.score_player1 }
    2.times { subject.score_player2 }
    expect(subject.game_score).to eq('40 - 30')
  end

  it 'should allow both players to reach 40' do
    3.times { subject.score_player2 }
    3.times { subject.score_player1 }

    expect(subject.game_score).to eq('40 - 40')
  end

  context 'Testing the conditions of winner in the game' do
    it 'should allow player1 to win first set' do
      3.times { subject.score_player1 }
      expect(subject.winner).to eq('player1')
    end

    it 'should only give me a winner when someone has won' do
      expect(subject.winner).to eq('nobody')
    end

    it 'should not allow player one to win without being 2 points ahead' do
      3.times { subject.score_player1 }
      2.times { subject.score_player2 }

      expect(subject.winner).to eq('nobody')
    end

    it 'should not allow player two to win without being 2 points ahead' do
      3.times { subject.score_player2 }
      2.times { subject.score_player1 }

      expect(subject.winner).to eq('nobody')
    end

    it 'should allow player two to win' do
      3.times { subject.score_player2 }

      expect(subject.winner).to eq('player2')
    end
  end

  context 'player1 scores when both players are at 40' do
    it 'should allow player1 to reach advantage in the game' do
      3.times { subject.score_player1 }
      3.times { subject.score_player2 }
      subject.score_player1

      expect(subject.winner).to eq('nobody')
      expect(subject.game_score).to eq('Advantage - 40')
    end
  end

  context 'player1 is at advantage, and player2 scores' do
    it 'should allow player2 to reach advantage in the game' do
      3.times { subject.score_player1 }
      3.times { subject.score_player2 }
      subject.score_player1
      subject.score_player2

      expect(subject.winner).to eq('nobody')
      expect(subject.game_score).to eq('40 - 40')
    end
  end

  context 'players score from advantage' do
    it 'should allow player one to win when scoring from advantage' do
      3.times { subject.score_player1 }
      3.times { subject.score_player2 }
      subject.score_player1
      # game winning score
      subject.score_player1

      expect(subject.winner).to eq('player1')
    end

    it 'should allow player two to win when scoring from advantage' do
      3.times { subject.score_player1 }
      3.times { subject.score_player2 }
      subject.score_player2
      # game winning score
      subject.score_player2

      expect(subject.winner).to eq('player2')
    end
  end
end
