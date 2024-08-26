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


  first_random_player = [player_1, player_2].sample

  puts "#{first_random_player.name} starts the game!"

  if first_random_player == player_1 

    puts "#{player_1.name} pick the row you want!"
    row = gets.chomp
    puts "#{player_1.name} now pick the column you want"
    column = gets.chomp
    main_board.board[row.to_i][column.to_i] = player_1.symbol
    main_board.display_board

  end