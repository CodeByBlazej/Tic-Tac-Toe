require_relative 'players'

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(3) { Array.new(3) }
  end

  # def check_score
  #   @board.each_with_index do |row, row_index|
  #     row.each_with_index do |symbol, column_index|
  #       p row[1]
  #     end
  #   end
  # end

  def check_row_score()
    @board[0].all?(player_1.symbol)
  end

  def display_board
    row_1 = @board[0].map { |element| element.nil? ? ' ' : element}
    p row_1
    p @board[0]
    p @board[1]
    p @board[2]
  end
end

