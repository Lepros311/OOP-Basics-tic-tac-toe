# classes:
# player - 2 objects: player1 and player2
# 	method(s) - select_square
# piece - 2 object: X's and O's
# board - 1 object: the board
# 	method(s) - draw_board, check_winner

class Player
  def initialize

  end

  def select_square
    puts "Select an empty square (1-9): "
    selection = gets.chomp
  end
end

class Piece
  def initialize

  end
end

class Board
  attr_accessor :row1, :row2, :row3
  attr_reader :line

  def initialize
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

  def sqaure_open?

  end

  def check_winner

  end
end

our_board = Board.new
our_board.draw_board
player1 = Player.new
player2 = Player.new
player1.select_square
