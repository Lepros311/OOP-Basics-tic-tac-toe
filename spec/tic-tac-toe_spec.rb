require_relative '../tic-tac-toe'

describe Board do
  describe "#game_over?" do
    subject(:game_end) { Board.new }
    it "return true when any winning combo" do
      expect(game_end.game_over?).to eq(true)
    end
  end
end

#So you need a Board to run the method on and the expectation, right?
# Start with writing out the expectation. Then, get yourself a Board. Then, make it have a particular state (for example, X-O-nil nil-nil-nil O-X-nil or however you store the board state).
