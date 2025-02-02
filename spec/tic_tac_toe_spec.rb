require_relative '../lib/game'
require_relative '../lib/sort/board'
require_relative '../lib/sort/players'

describe Board do
  describe '#check_row_score' do
    subject(:board) { described_class.new(Array.new(3) { Array.new(3, 'X') }) }
    let(:player) { instance_double(Player, name: 'Tom', symbol: 'X') }

    context 'when row scores are all the same' do
      before do
        string = '#{player.name} WON THE GAME!'
        allow(board).to receive(:puts)
      end

      it 'puts player name WON THE GAME!' do
        # result = board.check_row_score(player)
        expect(board).to receive(:puts).with('Tom WON THE GAME!').once
        board.check_row_score(player)
      end

      xit 'set winner to be true' do
        # player = 'Tom'
        result = board.check_row_score(player)
        expect(result).to be_truthy
      end
    end
  end
end
