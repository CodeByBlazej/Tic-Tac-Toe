require 'pry-byebug'
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


  # first_random_player = [player_1, player_2].sample

  # puts "#{first_random_player.name} starts the game!"

  # if main_board.all?(' ')
  #   play_round(first_random_player)
  # else
  #   play_round
  # end

  # def play_game(player_1, player_2, main_board)
    # binding.pry
    
    def play_round(player, main_board)
      puts "#{player.name} pick the row you want..."
      row = gets.chomp.to_i
      puts "#{player.name} now pick the column you want..."
      column = gets.chomp.to_i
      main_board.board[row][column] = player.symbol
      main_board.display_board
      main_board.check_row_score(player)
      main_board.check_column_score(player)
      main_board.check_diagonal_score(player)
      main_board.check_anti_diagonal_score(player)
    end
    
    round_number = (1..9)

    # round_number.each do |round|
    #   case round
    #   when round.
    #     first_random_player = [player_1, player_2].sample
    #     play_round(first_random_player, main_board)
    #   when round.even  
    #   end
    # end

    first_random_player = [player_1, player_2].sample
    
    round_number.each do |round|
      if round.odd?
        play_round(first_random_player, main_board)
      elsif round.even? && first_random_player == player_1
      play_round(player_2, main_board) 
      else play_round(player_1, main_board)
      end
    end

    # round_number.each do |round|
    #   if main_board.board.all? { |e| e.all?(nil) }
    #     first_random_player = [player_1, player_2].sample
    #     play_round(first_random_player, main_board)
    #   elsif main_board.board.any? { |e| e.include?(player_1.symbol) } && round.even?
    #   play_round(player_2, main_board) 
    #   else play_round(player_1, main_board)
    #   end
    # end

    # until main_board.check_row_score(player_1) do
    #   binding.pry
    #   if main_board.board.all? { |e| e.all?(nil) }
    #     first_random_player = [player_1, player_2].sample
    #     play_round(first_random_player, main_board)
    #   elsif main_board.board.each { |e| e.count}

    #   elsif main_board.board.any? { |e| e.include?(player_1.symbol) }
    #     play_round(player_2, main_board)
    #   else play_round(player_1, main_board)
    #   end
    # end

  # play_game(player_1, player_2, main_board)

  # if first_random_player == player_1 

  #   puts "#{player_1.name} pick the row you want!"
  #   row = gets.chomp
  #   puts "#{player_1.name} now pick the column you want"
  #   column = gets.chomp
  #   main_board.board[row.to_i][column.to_i] = player_1.symbol
  #   main_board.display_board
  #   else

  # end

  # def play_game(player_1, player_2, main_board)
    
  # end