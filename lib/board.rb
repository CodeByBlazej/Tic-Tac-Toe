class Board
  attr_accessor :board

  def initialize
    @board = Array.new(3) { Array.new(3) }
  end

  def display_board
    p @board[0]
    p @board[1]
    p @board[2]
  end
end

