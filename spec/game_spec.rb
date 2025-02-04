require_relative '../lib/game'
require_relative '../lib/sort/board'
require_relative '../lib/sort/players'

describe Game do
  describe '#create_objects_players_and_board' do
    subject(:game) { described_class.new }
    let(:board) { instance_double(Board) }

    it 'creates 2 objects for player' do
      game.instance_variable_set(:@player_1_name, 'adam')
      game.instance_variable_set(:@player_1_symbol, 'x')
      game.instance_variable_set(:@player_2_name, 'karol')
      game.instance_variable_set(:@player_2_symbol, 'o')

      expect(Player).to receive(:new).with('adam', 'x')
      expect(Player).to receive(:new).with('karol', 'o')
      game.create_objects_players_and_board
    end

    it 'creates 1 object for board' do
      expect(Board).to receive(:new).with(Array.new(3) { Array.new(3) }).and_return(board)
      expect(board).to receive(:display_board)
      game.create_objects_players_and_board
    end
  end
end
