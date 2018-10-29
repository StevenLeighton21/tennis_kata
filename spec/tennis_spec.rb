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
end
