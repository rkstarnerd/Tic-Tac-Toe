def  initialize_board
  moves = {}
  (1..9).each {|position| moves[position] = ' '}
  moves
end

def draw_board(moves)
  divider = "\t\t -----+-----+-----"
  puts "\t\t   A     B     C  "
  puts "\t\t1  #{moves[1]}  |  #{moves[2]}  |  #{moves[3]}  "
  puts divider
  puts "\t\t2  #{moves[4]}  |  #{moves[5]}  |  #{moves[6]}  "
  puts divider
  puts "\t\t3  #{moves[7]}  |  #{moves[8]}  |  #{moves[9]}  "
end

def key
  puts "A1 - 1, B1 - 2, C1 - 3, A2 - 4, B2 - 5, C2 - 6, A3 - 7, B3 - 8, C3 - 9"
end

def choose_position(moves)
  puts "Choose a position (from 1 to 9):"
  key
  player_position = gets.chomp.to_i

    until moves.has_key? player_position
      puts "Please choose from numbers 1-9"
      key
      player_position = gets.chomp.to_i
    end

  moves[player_position] = "X"
  draw_board(moves)

  if (moves[2] == "X" && moves[3] == "X" && moves[1] == " ") || 
    (moves[4] == "X" && moves[7] == "X" && moves[1] == " ") ||
    (moves[5] == "X" && moves[9] == "X" && moves[1] == " ")
    computer_position = 1
  elsif (moves[1] == "X" && moves[3] == "X" && moves[2] == " ") || 
    (moves[5] == "X" && moves[8] == "X" && moves[2] == " ") ||
    (moves[5] == "X" && moves[9] == "X" && moves[2] == " ")
    computer_position = 2
  elsif (moves[2] == "X" && moves[1] == "X" && moves[3] == " ") || 
    (moves[6] == "X" && moves[9] == "X" && moves[3] == " ") ||
    (moves[5] == "X" && moves[7] == "X" && moves[3] == " ")
    computer_position = 3
  elsif (moves[5] == "X" && moves[6] == "X" && moves[4] == " ") || 
    (moves[1] == "X" && moves[7] == "X" && moves[4] == " ")
    computer_position = 4
  elsif (moves[4] == "X" && moves[6] == "X" && moves[5] == " ") || 
    (moves[2] == "X" && moves[8] == "X" && moves[5] == " ") ||
    (moves[1] == "X" && moves[9] == "X" && moves[5] == " ") ||
    (moves[3] == "X" && moves[7] == "X" && moves[5] == " ")
    computer_position = 5
  elsif (moves[4] == "X" && moves[5] == "X" && moves[6] == " ") || 
    (moves[3] == "X" && moves[9] == "X" && moves[6] == " ")
    computer_position = 6
  elsif (moves[8] == "X" && moves[9] == "X" && moves[7] == " ") || 
    (moves[1] == "X" && moves[4] == "X" && moves[7] == " ") ||
    (moves[5] == "X" && moves[3] == "X" && moves[7] == " ")
    computer_position = 7
  elsif (moves[7] == "X" && moves[9] == "X" && moves[8] == " ") || 
    (moves[2] == "X" && moves[5] == "X" && moves[8] == " ")
    computer_position = 8
  elsif (moves[7] == "X" && moves[8] == "X" && moves[9] == " ") || 
    (moves[6] == "X" && moves[3] == "X" && moves[9] == " ") ||
    (moves[5] == "X" && moves[1] == "X" && moves[9] == " ")
    computer_position = 9
  else
    computer_position = moves.keys.sample
  end

  moves[computer_position] = "O"
  sleep(1)
  draw_board(moves)

  winning_combos(moves)
end

def winning_combos(moves)
  if (moves[1] == "X" && moves[2] == "X" && moves[3] == "X") ||
    (moves[4] == "X" && moves[5] == "X" && moves[6] == "X") ||
    (moves[7] == "X" && moves[8] == "X" && moves[9] == "X") ||
    (moves[1] == "X" && moves[4] == "X" && moves[7] == "X") ||
    (moves[2] == "X" && moves[5] == "X" && moves[8] == "X") ||
    (moves[3] == "X" && moves[6] == "X" && moves[9] == "X") ||
    (moves[1] == "X" && moves[5] == "X" && moves[9] == "X") ||
    (moves[3] == "X" && moves[5] == "X" && moves[7] == "X")
    puts "You won!"
    play_again
  elsif (moves[1] == "O" && moves[2] == "O" && moves[3] == "O") ||
    (moves[4] == "O" && moves[5] == "O" && moves[6] == "O") ||
    (moves[7] == "O" && moves[8] == "O" && moves[9] == "O") ||
    (moves[1] == "O" && moves[4] == "O" && moves[7] == "O") ||
    (moves[2] == "O" && moves[5] == "O" && moves[8] == "O") ||
    (moves[3] == "O" && moves[6] == "O" && moves[9] == "O") ||
    (moves[1] == "O" && moves[5] == "O" && moves[9] == "O") ||
    (moves[3] == "O" && moves[5] == "O" && moves[7] == "O")
    puts "Womp, Womp, Womp... You lost.."
    play_again    
  elsif moves.values.include? " "
    choose_position(moves)
  else
    puts "It's a draw!"
    play_again
  end
end

def play_again
  puts "Would you like to play again? (Y/N)"
  answer = gets.chomp.upcase
  if answer == 'Y'
    moves = initialize_board
    draw_board(moves)
    choose_position(moves)
  elsif answer == 'N'
    puts "Thanks for playing!"
  else
    puts "Please enter Y or N"
    answer = gets.chomp.upcase
  end
end

def clear_board(moves)
  moves = { 
            1 => " ", 2 => " ", 3 => " ", 
            4 => " ", 5 => " ", 6 => " ",
            7 => " ", 8 => " ", 9 => " "
           }
  draw_board(moves)
  choose_position
end

moves = initialize_board
draw_board(moves)
choose_position(moves)