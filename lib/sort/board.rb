class Board
  attr_accessor :board, :winner

  def initialize
    @board = Array.new(3) { Array.new(3) }
  end

  def check_row_score(player)
    @board.any? do |scores|
      if scores.all? { |score| score == player.symbol }
        puts "#{player.name} WON THE GAME!" 
        @winner = true
      end
    end
  end

  def check_column_score(player)
    (0...@board.first.size).each do |index|
      if @board.all? { |row| row[index] == player.symbol }
        puts "#{player.name} WON THE GAME!"
        @winner = true
      end     
    end
  end

  def check_diagonal_score(player)
    if (0...@board.size).all? { |i| @board[i][i] == player.symbol }
      puts "#{player.name} WON THE GAME!"
      @winner = true
    end
  end

  def check_anti_diagonal_score(player)
    if (0...@board.size).all? { |i| @board[i][@board.size - 1 - i] == player.symbol }
      puts "#{player.name} WON THE GAME!"
      @winner = true
    end
  end

  def display_board
    row_1 = @board[0].map { |element| element.nil? ? ' ' : element}
    row_2 = @board[1].map { |element| element.nil? ? ' ' : element}
    row_3 = @board[2].map { |element| element.nil? ? ' ' : element}

    p row_1
    p row_2
    p row_3
  end
end