class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def select_square
    puts "#{name}, select an empty square (1-9): "
    selected_square = gets.chomp
  end
end

class Piece
  attr_accessor :player_piece

  def initialize(player_piece)
    @player_piece = player_piece.upcase
  end

  def to_s
    player_piece
  end
end

class Board
  attr_accessor :row1, :row2, :row3
  attr_reader :line, :player_piece

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

  def player2turn(player2, player_piece)
    selected_square = player2.select_square
    self.add_piece(player_piece, selected_square)
    self.draw_board
  end

  def player1turn(player1, player_piece)
    selected_square = player1.select_square
    self.add_piece(player_piece, selected_square)
    self.draw_board
  end

  def game_over?(player1piece, player2piece)
    if (@row1[1] == player1piece && @row1[5] == player1piece && @row1[9] == player1piece) || (@row2[1] == player1piece && @row2[5] == player1piece && @row[9] == player1piece) || (@row3[1] == player1piece && @row3[5] == player1piece && @row3[9] == player1piece) || (@row3[1] == player1piece && @row2[5] == player1piece && @row1[9] == player1piece) || (@row1[1] == player1piece && @row2[5] == player1piece && @row3[9] == player1piece) || (@row1[1] == player2piece && @row1[5] == player2piece && @row1[9] == player2piece) || (@row2[1] == player2piece && @row2[5] == player2piece && @row[9] == player2piece) || (@row3[1] == player2piece && @row3[5] == player2piece && @row3[9] == player2piece) || (@row3[1] == player2piece && @row2[5] == player2piece && @row1[9] == player2piece) || (@row1[1] == player2piece && @row2[5] == player2piece && @row3[9] == player2piece)
      true
    else
      false
    end
  end

  def play_game(player1, player2, player1piece, player2piece)
    until game_over?(player2piece, player1piece)
      self.player2turn(player2, player2piece)
      self.player1turn(player1, player1piece)
    end
  end
end

puts "Player 1, what's your name?"
player1 = Player.new(gets.chomp)
puts "Player 2, what's your name?"
player2 = Player.new(gets.chomp)

puts "#{player1.name}, do you want to be X or O?"
player1piece = Piece.new(gets.chomp)
player2piece = Piece.new(player1piece.player_piece == "X" ? "O" : "X")
selected_square = player1.select_square

our_board = Board.new(player1piece)
our_board.add_piece(player1piece, selected_square)
our_board.draw_board

our_board.play_game(player1, player2, player1piece, player2piece)
