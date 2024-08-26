# require_relative 'spec/players'

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

  # row_1 = @board[0]
  # row_2 = @board[1]
  # row_3 = @board[2]

  

  def check_row_score(player)
    @board.any? do |scores|
      scores.all? { |score| score == player.symbol }
    end
  end

  def check_column_score(player)
    (0...@board.first.size).each do |index|
      return player.symbol if @board.all? { |row| row[index] == player.symbol }     
    end
  end

  def check_diagonal_score(player)
    if (0...@board.size).all? { |i| @board[i][i] == player.symbol }
      return player.symbol == 'winner'
    end
  end

  def check_anti_diagonal_score(player)
    if (0...@board.size).all? { |i| @board[i][@board.size - 1 - i] == player.symbol }
      return player.symbol
    end
  end


  # def check_column_score(player)
  #   @board.each_with_index do |row, row_index|
  #     row.each_with_index do |element, column_index|
  #       return element if column_index == player.symbol
  #     end
  #   end
  # end

  def display_board
    row_1 = @board[0].map { |element| element.nil? ? ' ' : element}
    row_2 = @board[1].map { |element| element.nil? ? ' ' : element}
    row_3 = @board[2].map { |element| element.nil? ? ' ' : element}

    p row_1
    p row_2
    p row_3
  end
end
 
