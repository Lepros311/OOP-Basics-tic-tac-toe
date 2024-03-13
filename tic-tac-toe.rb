class Player
  def initialize

  end

  def select_square
    puts "Select an empty square (1-9): "
    selected_square = gets.chomp
  end
end

class Piece
  attr_accessor :player_piece

  def initialize(player_piece)
    @player_piece = player_piece
  end

  def to_s
    player_piece
  end
end

class Board
  attr_accessor :row1, :row2, :row3
  attr_reader :line, :player_piece, :selected_square

  def initialize(player_piece)
    @row1 = [" ", " ", " ", "|", " ", " ", " ", "|", " ", " ", " "]
    @line = ["---|---|---"]
    @row2 = [" ", " ", " ", "|", " ", " ", " ", "|", " ", " ", " "]
    @row3 = [" ", " ", " ", "|", " ", " ", " ", "|", " ", " ", " "]
  end

  def draw_board
    puts row1.join('')
    puts line
    puts row2.join('')
    puts line
    puts row3.join('')
  end

  def square_open?

  end

  def add_piece(player_piece, selected_square)
    case selected_square
    when "1"
      row1[1] = player_piece
    when "2"
      row1[5] = player_piece
    when "3"
      row1[9] = player_piece
    when "4"
      row2[1] = player_piece
    when "5"
      row2[5] = player_piece
    when "6"
      row2[9] = player_piece
    when "7"
      row3[1] = player_piece
    when "8"
      row3[5] = player_piece
    when "9"
      row3[9] = player_piece
    else
      "Invalid selection. Please choose an open square (1-9): "
    end
  end

  def check_winner

  end
end


player1 = Player.new
player2 = Player.new

puts "Player 1, do you want to be X or O?"
player1piece = Piece.new(gets.chomp)
selected_square = player1.select_square

our_board = Board.new(player1piece)
our_board.add_piece(player1piece, selected_square)
our_board.draw_board
