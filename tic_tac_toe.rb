require_relative 'lib/players'
require_relative 'lib/board'

adam = Player.new('Adam', 'X')
puts adam.info

blazej = Player.new('Blazej', 'O')
puts blazej.info

new_board = Board.new
p new_board.board[0]
p new_board.board[1]
p new_board.board[2]

new_board.board[0][0] = blazej.symbol
# p new_board.board[0]

new_board.board[0][1] = adam.symbol
new_board.display_board



def play_game
  player_1_name = gets.chomp
  player_1_symbol = gets.chomp

  player_2_name = gets.chomp
  player_2_symbol = gets.chomp

  player_1 = Player.new(player_1_name, player_1_symbol)
  player_2 = Player.new(player_2_name, player_2_symbol)

  main_board = Board.new
  main_board.display_board
  # player_choice = gets.chomp
  p main_board.check_row_score
  main_board.board[0][0] = player_1.symbol
  main_board.board[0][1] = player_1.symbol
  main_board.board[0][2] = player_2.symbol

  p main_board.check_row_score
  main_board.display_board
  p main_board.check_row_score
  p player_1.symbol
  p player_1.name
end

play_game