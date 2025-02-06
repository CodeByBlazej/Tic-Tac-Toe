require_relative '../lib/game'
require_relative '../lib/sort/board'
require_relative '../lib/sort/players'

describe Game do
  describe '#create_objects_players_and_board' do
    subject(:game) { described_class.new }
    let(:board) { instance_double(Board) }

    before do
      game.instance_variable_set(:@player_1_name, 'adam')
      game.instance_variable_set(:@player_1_symbol, 'x')
      game.instance_variable_set(:@player_2_name, 'karol')
      game.instance_variable_set(:@player_2_symbol, 'o')
    end

    it 'creates 2 objects for player' do
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

  describe '#set_rounds' do
    context 'if main_board.winner is false' do
      subject(:game) { described_class.new }
      let(:main_board) { instance_double(Board, winner: false) }

      before do
        game.instance_variable_set(:@player_1_name, 'adam')
        game.instance_variable_set(:@player_1_symbol, 'x')
        game.instance_variable_set(:@player_2_name, 'karol')
        game.instance_variable_set(:@player_2_symbol, 'o')
        game.instance_variable_set(:@player1, double('Player'))
        game.instance_variable_set(:@player2, double('Player'))

        game.instance_variable_set(:@main_board, main_board)

        allow(game).to receive(:play_round)
        allow(game).to receive(:puts)
      end

      it 'puts You have a DRAW!' do
        expect(game).to receive(:puts).with('You have a DRAW!')
        game.set_rounds
      end
    end

    context 'if main_board.winner is true' do
      subject(:game) { described_class.new }
      let(:main_board) { instance_double(Board, winner: true) }

      before do
        game.instance_variable_set(:@player_1_name, 'adam')
        game.instance_variable_set(:@player_1_symbol, 'x')
        game.instance_variable_set(:@player_2_name, 'karol')
        game.instance_variable_set(:@player_2_symbol, 'o')
        game.instance_variable_set(:@player1, double('Player'))
        game.instance_variable_set(:@player2, double('Player'))

        game.instance_variable_set(:@main_board, main_board)

        allow(game).to receive(:play_round)
        allow(game).to receive(:puts)
      end

      it 'does NOT puts You have a DRAW!' do
        expect(game).not_to receive(:puts).with('You have a DRAW!')
        game.set_rounds
      end
    end
  end

  describe '#play_round' do
    context 'when the chosen spot is empty' do
      subject(:game) { described_class.new }
      let(:player1) { instance_double(Player, name: 'Tom', symbol: 'X') }
      let(:board_array) { Array.new(3) { Array.new(3) } }
      let(:main_board) { instance_double(Board) }

      before do
        game.instance_variable_set(:@player1, player1)
        game.instance_variable_set(:@main_board, main_board)

        allow(game).to receive(:gets).and_return('0', '0')
        allow(game).to receive(:puts)
        allow(main_board).to receive(:board).and_return(board_array)
        allow(main_board).to receive(:display_board)
        allow(main_board).to receive(:check_row_score).with(player1)
        allow(main_board).to receive(:check_column_score).with(player1)
        allow(main_board).to receive(:check_diagonal_score).with(player1)
        allow(main_board).to receive(:check_anti_diagonal_score).with(player1)
      end

      it 'checks for every score on the board' do
        expect(main_board).to receive(:check_row_score).with(player1)
        expect(main_board).to receive(:check_column_score).with(player1)
        expect(main_board).to receive(:check_diagonal_score).with(player1)
        expect(main_board).to receive(:check_anti_diagonal_score).with(player1)
        game.play_round(player1, main_board)
        expect(board_array[0][0]).to eq('X')
      end
    end

    context 'when the chosen spot is already taken' do
      subject(:game) { described_class.new }
      let(:player1) { instance_double(Player, name: 'Frank', symbol: 'O') }
      let(:board_array) { Array.new(3) { Array.new(3) } }
      let(:main_board) { instance_double(Board) }

      before do
        board_array[1][1] = 'X'

        game.instance_variable_set(:@main_board, main_board)
        allow(game).to receive(:gets).and_return('1', '1', '0', '0')
        allow(game).to receive(:puts)
        allow(main_board).to receive(:board).and_return(board_array)
        allow(main_board).to receive(:display_board)
        allow(main_board).to receive(:check_row_score).with(player1)
        allow(main_board).to receive(:check_column_score).with(player1)
        allow(main_board).to receive(:check_diagonal_score).with(player1)
        allow(main_board).to receive(:check_anti_diagonal_score).with(player1)
      end

      it 'puts this spot is already taken!' do
        expect(game).to receive(:puts).with('This spot is already taken, please choose another one.').once
        game.play_round(player1, main_board)
        expect(board_array[0][0]).to eq('O')
      end
    end
  end
end
