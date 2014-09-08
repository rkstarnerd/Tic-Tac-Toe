$moves = { 
          a1: " ", b1: " ", c1: " ", 
          a2: " ", b2: " ", c2: " ",
          a3: " ", b3: " ", c3: " "
        }

$options = [1, 2, 3, 4, 5, 6, 7, 8, 9]

def draw_board
  row_one = "1  #{$moves[:a1]}  |  #{$moves[:b1]}  |  #{$moves[:c1]}  "
  row_two = "2  #{$moves[:a2]}  |  #{$moves[:b2]}  |  #{$moves[:c2]}  "
  row_three = "3  #{$moves[:a3]}  |  #{$moves[:b3]}  |  #{$moves[:c3]}  "
  divider = " -----+-----+-----"
  puts "   A     B     C  "
  puts row_one
  puts divider
  puts row_two
  puts divider
  puts row_three
end

def key
  puts "A1 - 1, B1 - 2, C1 - 3, A2 - 4, B2 - 5, C2 - 6, A3 - 7, B3 - 8, C3 - 9"
end

def choose_position
  puts "Choose a position (from 1 to 9) to place a piece:"
  key
  player_position = gets.chomp.to_i
    until $options.include? player_position
      puts "Please choose from numbers 1-9"
      key
      player_position = gets.chomp.to_i
    end
  $options.delete(player_position)

  if player_position == 1
    $moves[:a1] = "X"
  elsif player_position == 2
    $moves[:b1] = "X"
  elsif player_position == 3
    $moves[:c1] = "X"
  elsif player_position == 4
    $moves[:a2] = "X"
  elsif player_position == 5
    $moves[:b2] = "X"
  elsif player_position == 6
    $moves[:c2] = "X"
  elsif player_position == 7
    $moves[:a3] = "X"
  elsif player_position == 8
    $moves[:b3] = "X"
  elsif player_position == 9
    $moves[:c3] = "X"
  end

  if ($moves[:b1] == "X" && $moves[:c1] == "X" && $moves[:a1] == " ") || 
    ($moves[:a2] == "X" && $moves[:a3] == "X" && $moves[:a1] == " ") ||
    ($moves[:b2] == "X" && $moves[:c3] == "X" && $moves[:a1] == " ")
    computer_position = 1
  elsif ($moves[:a1] == "X" && $moves[:c1] == "X" && $moves[:b1] == " ") || 
    ($moves[:b2] == "X" && $moves[:b3] == "X" && $moves[:b1] == " ") ||
    ($moves[:b2] == "X" && $moves[:c3] == "X" && $moves[:b1] == " ")
    computer_position = 2
  elsif ($moves[:b1] == "X" && $moves[:a1] == "X" && $moves[:c1] == " ") || 
    ($moves[:c2] == "X" && $moves[:c3] == "X" && $moves[:c1] == " ") ||
    ($moves[:b2] == "X" && $moves[:a3] == "X" && $moves[:c1] == " ")
    computer_position = 3
  elsif ($moves[:b2] == "X" && $moves[:c2] == "X" && $moves[:a2] == " ") || 
    ($moves[:a1] == "X" && $moves[:a3] == "X" && $moves[:a2] == " ")
    computer_position = 4
  elsif ($moves[:a2] == "X" && $moves[:c2] == "X" && $moves[:b2] == " ") || 
    ($moves[:b1] == "X" && $moves[:b3] == "X" && $moves[:b2] == " ") ||
    ($moves[:a1] == "X" && $moves[:c3] == "X" && $moves[:b2] == " ") ||
    ($moves[:c1] == "X" && $moves[:a3] == "X" && $moves[:b2] == " ")
    computer_position = 5
  elsif ($moves[:a2] == "X" && $moves[:b2] == "X" && $moves[:c2] == " ") || 
    ($moves[:c1] == "X" && $moves[:c3] == "X" && $moves[:c2] == " ")
    computer_position = 6
  elsif ($moves[:b3] == "X" && $moves[:c3] == "X" && $moves[:a3] == " ") || 
    ($moves[:a1] == "X" && $moves[:a2] == "X" && $moves[:a3] == " ") ||
    ($moves[:b2] == "X" && $moves[:c1] == "X" && $moves[:a3] == " ")
    computer_position = 7
  elsif ($moves[:a3] == "X" && $moves[:c3] == "X" && $moves[:b3] == " ") || 
    ($moves[:b1] == "X" && $moves[:b2] == "X" && $moves[:b3] == " ")
    computer_position = 8
  elsif ($moves[:a3] == "X" && $moves[:b3] == "X" && $moves[:c3] == " ") || 
    ($moves[:c2] == "X" && $moves[:c1] == "X" && $moves[:c3] == " ") ||
    ($moves[:b2] == "X" && $moves[:a1] == "X" && $moves[:c3] == " ")
    computer_position = 9
  else
    computer_position = $options.sample
  end

  $options.delete(computer_position)

  if computer_position == 1
    $moves[:a1] = "O"
  elsif computer_position == 2
    $moves[:b1] = "O"
  elsif computer_position == 3
    $moves[:c1] = "O"
  elsif computer_position == 4
    $moves[:a2] = "O"
  elsif computer_position == 5
    $moves[:b2] = "O"
  elsif computer_position == 6
    $moves[:c2] = "O"
  elsif computer_position == 7
    $moves[:a3] = "O"
  elsif computer_position == 8
    $moves[:b3] = "O"
  elsif computer_position == 9
    $moves[:c3] = "O"
  end

  draw_board

  winning_combos
end

def winning_combos
  if ($moves[:a1] == "X" && $moves[:b1] == "X" && $moves[:c1] == "X") ||
    ($moves[:a2] == "X" && $moves[:b2] == "X" && $moves[:c2] == "X") ||
    ($moves[:a3] == "X" && $moves[:b3] == "X" && $moves[:c3] == "X") ||
    ($moves[:a1] == "X" && $moves[:a2] == "X" && $moves[:a3] == "X") ||
    ($moves[:b1] == "X" && $moves[:b2] == "X" && $moves[:b3] == "X") ||
    ($moves[:c1] == "X" && $moves[:c2] == "X" && $moves[:c3] == "X") ||
    ($moves[:a1] == "X" && $moves[:b2] == "X" && $moves[:c3] == "X") ||
    ($moves[:c1] == "X" && $moves[:b2] == "X" && $moves[:a3] == "X")
    puts "You won!"
    play_again
  elsif ($moves[:a1] == "O" && $moves[:b1] == "O" && $moves[:c1] == "O") ||
    ($moves[:a2] == "O" && $moves[:b2] == "O" && $moves[:c2] == "O") ||
    ($moves[:a3] == "O" && $moves[:b3] == "O" && $moves[:c3] == "O") ||
    ($moves[:a1] == "O" && $moves[:a2] == "O" && $moves[:a3] == "O") ||
    ($moves[:b1] == "O" && $moves[:b2] == "O" && $moves[:b3] == "O") ||
    ($moves[:c1] == "O" && $moves[:c2] == "O" && $moves[:c3] == "O") ||
    ($moves[:a1] == "O" && $moves[:b2] == "O" && $moves[:c3] == "O") ||
    ($moves[:c1] == "O" && $moves[:b2] == "O" && $moves[:a3] == "O")
    puts "Womp, Womp, Womp... You lost.."
    play_again    
  elsif $moves.values.include? " "
    choose_position
  else
    puts "It's a draw!"
    play_again
  end
end

def play_again
  puts "Would you like to play again? (Y/N)"
  answer = gets.chomp.upcase
  if answer == 'Y'
    clear_board
    choose_position
  elsif answer == 'N'
    puts "Thanks for playing!"
  else
    puts "Please enter Y or N"
    answer = gets.chomp.upcase
  end
end

def clear_board
  $moves = { 
          a1: " ", b1: " ", c1: " ", 
          a2: " ", b2: " ", c2: " ",
          a3: " ", b3: " ", c3: " "
        }
  $options = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  draw_board
  choose_position
end

draw_board

choose_position