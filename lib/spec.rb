require_relative 'spec/players'
require_relative 'spec/board'

puts 'Select 1st player name'
player_1_name = gets.chomp
puts 'Select 1st player symbol'
player_1_symbol = gets.chomp

puts 'Select 2nd player name'
player_2_name = gets.chomp
puts 'Select 2nd player symbol'
player_2_symbol = gets.chomp
puts "Now, let's play the game!"

player_1 = Player.new(player_1_name, player_1_symbol)
player_2 = Player.new(player_2_name, player_2_symbol)

main_board = Board.new
main_board.display_board


main_board.winner = false

def play_round(player, main_board)
  puts "#{player.name} pick the row you want (0, 1 or 2)..."
  row = gets.chomp.to_i
  puts "#{player.name} now pick the column you want (0, 1 or 2)..."
  column = gets.chomp.to_i

  if main_board.board[row][column] == nil
    main_board.board[row][column] = player.symbol
    main_board.display_board
  else
    puts "This spot is already taken, please choose another one."
    play_round(player, main_board)
  end
  
  main_board.check_row_score(player)
  main_board.check_column_score(player)
  main_board.check_diagonal_score(player)
  main_board.check_anti_diagonal_score(player)
end
    
round_number = (1..9)

first_random_player = [player_1, player_2].sample
    
round_number.each do |round|
  if round.odd?
    play_round(first_random_player, main_board)
  elsif round.even? && first_random_player == player_1
    play_round(player_2, main_board) 
  else 
    play_round(player_1, main_board)
  end
    break if main_board.winner == true 
  end

if main_board.winner == false
  puts "You have a DRAW!"
end