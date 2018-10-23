require 'tennis.rb'

describe Tennis do
  subject { described_class.new }

  it 'should start a game with no score' do
    expect subject.game_score to eq '0 - 0'
  end
end
