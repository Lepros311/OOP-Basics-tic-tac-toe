require_relative '../tic-tac-toe'

describe Board do
  describe "#game_over?" do
    subject(:game_end) { Board.new('X') }
    it "returns true with a winning combo" do
      game_end.add_piece('X', '1')
      game_end.add_piece('X', '2')
      game_end.add_piece('X', '3')
      expect(game_end.game_over?('X')).to eq(true)
    end

    it "returns false with a non-winning combo" do
      game_end.add_piece('X', '1')
      game_end.add_piece('X', '2')
      game_end.add_piece('X', '5')
      expect(game_end.game_over?('X')).to eq(false)
    end
  end
end

describe Player do
  describe "#select_square" do
    let(:board) { instance_double(Board) }
    subject(:player) { described_class.new("Player 1") }

    context "when player selects an empty square" do
      before do
        allow(player).to receive(:puts)
        allow(player).to receive(:gets).and_return("5\n") # Stubbing user input for square 5
        allow(board).to receive(:square_open?).with("5").and_return(true) # Stubbing board method
      end
      it "returns the selected square" do
        expect(player.select_square(board)).to eq("5")
      end
    end

    context "when player selects a square that is already taken" do
      before do
        allow(player).to receive(:puts)
        allow(player).to receive(:gets).and_return("3\n") # Stubbing user input for square 3
        allow(board).to receive(:square_open?).with("3").and_return(false) # Stubbing board method
      end
      it "prompts the player to select another square" do
        expect(player).to receive(:puts).with("That square is taken!")
        player.select_square(board)
      end
    end


  end
end
