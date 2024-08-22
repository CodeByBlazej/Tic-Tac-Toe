class Board
  attr_accessor :board

  def initialize
    @board = Array.new(3) { Array.new(3) }
  end

  def check_score
    @board.each_with_index do |row, row_index|
      row.each_with_index do |symbol, column_index|
        p row[1]
      end
    end
  end

  def display_board
    p @board[0]
    p @board[1]
    p @board[2]
  end
end

