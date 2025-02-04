require_relative 'sort/players'
require_relative 'sort/board'

class Game
  attr_reader :player1, :player2, :player_1_name, :player_1_symbol, :player_2_name, :player_2_symbol, :main_board

  def initialize
    @player1 = player1
    @player2 = player2
    @player_1_name = player_1_name
    @player_1_symbol = player_1_symbol
    @player_2_name = player_2_name
    @player_2_symbol = player_2_symbol
    @main_board = main_board
  end

  def play_game
    select_players_names_and_symbols
    create_objects_players_and_board
    set_rounds
  end

  def select_players_names_and_symbols
    puts 'Select 1st player name'
    @player_1_name = gets.chomp
    puts 'Select 1st player symbol'
    @player_1_symbol = gets.chomp

    puts 'Select 2nd player name'
    @player_2_name = gets.chomp
    puts 'Select 2nd player symbol'
    @player_2_symbol = gets.chomp
    puts "Now, let's play the game!"
  end

  def create_objects_players_and_board
    @player1 = Player.new(@player_1_name, @player_1_symbol)
    @player2 = Player.new(@player_2_name, @player_2_symbol)

    @main_board = Board.new(Array.new(3) { Array.new(3) })
    main_board.display_board
  end

  def set_rounds
    round_number = (1..9)

    first_random_player = [player1, player2].sample

    round_number.each do |round|
      if round.odd?
        play_round(first_random_player, main_board)
      elsif round.even? && first_random_player == player1
        play_round(player2, main_board)
      else
        play_round(player1, main_board)
      end
      break if main_board.winner == true
    end

    puts 'You have a DRAW!' if main_board.winner == false
  end

  def play_round(player, main_board)
    puts "#{player.name} pick the row you want (0, 1 or 2)..."
    row = gets.chomp.to_i
    puts "#{player.name} now pick the column you want (0, 1 or 2)..."
    column = gets.chomp.to_i

    if main_board.board[row][column].nil?
      main_board.board[row][column] = player.symbol
      main_board.display_board
    else
      puts 'This spot is already taken, please choose another one.'
      play_round(player, main_board)
    end

    main_board.check_row_score(player)
    main_board.check_column_score(player)
    main_board.check_diagonal_score(player)
    main_board.check_anti_diagonal_score(player)
  end
end
