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

  def game_over?(player_piece)
    winning_combinations = [
      # Horizontal
      [@row1[1], @row1[5], @row1[9]],
      [@row2[1], @row2[5], @row2[9]],
      [@row3[1], @row3[5], @row3[9]],
      # Vertical
      [@row1[1], @row2[1], @row3[1]],
      [@row1[5], @row2[5], @row3[5]],
      [@row1[9], @row2[9], @row3[9]],
      # Diagonal
      [@row1[1], @row2[5], @row3[9]],
      [@row1[9], @row2[5], @row3[1]]
    ]

    winning_combinations.any? { |combo| combo.all? { |square| square == player_piece } }
  end


 def play_game(player1, player2, player1piece, player2piece)
   until game_over?(player1piece) || game_over?(player2piece)
        self.player2turn(player2, player2piece)
        break if game_over?(player2piece)  # Check if player2 has won before player1's turn
        self.player1turn(player1, player1piece)
   end
   if game_over?(player1piece)
    puts "#{player1.name} wins!"
   elsif game_over?(player2piece)
    puts "#{player2.name} wins!"
   elsif [@row1[1], @row1[5], @row1[9],
    @row2[1], @row2[5], @row2[9],
    @row3[1], @row3[5], @row3[9]].all? { |square| square != " " }
    puts "It's a draw!"
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
