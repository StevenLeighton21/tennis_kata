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
end
