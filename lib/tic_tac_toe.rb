class TicTacToe
  
  def initialize(board = nil) 
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2], 
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
    ]
  
  def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  
  def input_to_index(users_input)
    users_input.to_i - 1
  end 
  
  def move(index, token = "X")
    @board[index] = token 
  end 
  
  def position_taken?(index)
     ((@board[index] == "X") || (@board[index] == "O"))
    end 
    
  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end
  
  
  def turn
    puts "Pick a position 1-9?"
    input = gets.chomp
    index = input_to_index(input)
    char = current_player 
    if valid_move?(index)
      move(index, char)
      puts display_board
    elsif
      turn
    end 
  end 
  
  def turn_count
    count = 0 
    @board.each do |turns|
      if turns == "X" || turns == "O"
        count += 1
      end 
    end
    count 
  end 
  
  def current_player
    if turn_count % 2 == 0
      "X"
    else 
      "O"
    end 
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      if (@board[combo[0]]) == "X" && (@board[combo[1]]) == "X" && 
        (@board[combo[2]]) == "X"
        return combo
      elsif (@board[combo[0]]) == "O" && (@board[combo[1]]) == "O" && 
        (@board[combo[2]]) == "O"
        return combo 
      end
      false 
  end
  end 
  
  def full?
    @board.all? {|full| full != " "}
  end 
  
  def draw?
    full? && !won?
  end 
  
  def over?
    won? || full?
  end 
  
  def winner
    WIN_COMBINATIONS.detect do |combo|
      if (@board[combo[0]]) == "X" && (@board[combo[1]]) == "X" && 
        (@board[combo[2]]) == "X"
        return "X"
      elsif (@board[combo[0]]) == "O" && (@board[combo[1]]) == "O" && 
        (@board[combo[2]]) == "O"
        return "O"
      end
      nil 
  end
  end 
  
    def play 
      while over? == false
        turn 
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end 
    end 
    
end 