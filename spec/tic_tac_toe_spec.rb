require_relative '../lib/game'
require_relative '../lib/sort/board'
require_relative '../lib/sort/players'

describe Board do
  describe '#check_row_score' do
    context 'when row scores are all the same' do
      subject(:board) { described_class.new(Array.new(3) { Array.new(3, 'X') }) }
      let(:player) { instance_double(Player, name: 'Tom', symbol: 'X') }

      before do
        allow(board).to receive(:puts)
      end

      it 'puts player name WON THE GAME!' do
        expect(board).to receive(:puts).with("#{player.name} WON THE GAME!").once
        board.check_row_score(player)
      end

      it 'set winner to be true' do
        result = board.check_row_score(player)
        expect(result).to be_truthy
        expect(board.winner).to eq(true)
      end
    end

    context 'when row scores are not all the same' do
      subject(:board) { described_class.new(Array.new(3) { Array.new(3) }) }
      let(:player) { instance_double(Player, name: 'Alex', symbol: 'O') }

      before do
        allow(board).to receive(:puts)
      end

      it 'does not puts player name WON THE GAME!' do
        expect(board).not_to receive(:puts).with("#{player.name} WON THE GAME!")
        board.check_row_score(player)
      end

      it 'does not set winner to be true' do
        result = board.check_row_score(player)
        expect(result).not_to be_truthy
        expect(board.winner).to be(false)
      end
    end
  end

  describe '#check_column_score' do
    context 'when column scores are all the same' do
      subject(:board) { described_class.new(Array.new(3) { Array.new(['X', ' ', ' ']) }) }
      let(:player) { instance_double(Player, name: 'Tom', symbol: 'X') }

      before do
        allow(board).to receive(:puts)
      end

      it 'puts player name WON THE GAME!' do
        expect(board).to receive(:puts).with("#{player.name} WON THE GAME!")
        board.check_column_score(player)
      end

      it 'set winner to be true' do
        result = board.check_column_score(player)
        expect(result).to be_truthy
        expect(board.winner).to eq(true)
      end
    end

    context 'when column scores are not all the same' do
      subject(:board) { described_class.new(Array.new(3) { Array.new(3) }) }
      let(:player) { instance_double(Player, name: 'Alex', symbol: 'O') }

      before do
        allow(board).to receive(:puts)
      end

      it 'does not puts player name WON THE GAME!' do
        expect(board).not_to receive(:puts).with("#{player.name} WON THE GAME!")
        board.check_column_score(player)
      end

      it 'does not set winner to be true' do
        result = board.check_column_score(player)
        expect { result }.not_to(change { board.winner })
        expect(board.winner).to eq(false)
      end
    end
  end
end
