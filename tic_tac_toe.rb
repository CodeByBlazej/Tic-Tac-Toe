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
  kamil = Player.new('Kamil', 'O')
  tomek = Player.new('Tomek', 'X')

end