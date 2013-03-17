require 'minitest/autorun'
require_relative "../lib/player"

describe "Player" do

	before do
		@player1 = Player.new("Ace")
	end

	it "has a name" do
		@player1.name.must_equal("Ace")
	end

	it "takes only valid inputs listed on the grid (ex: a1)" do
	end

	it "can mark a spot on the grid if not occupied by other player" do
	end
end

describe "TicTacToe game" do
	# test_game = Ttt.new
	# test_game.game_start

	it "has a grid" do
	end

	it "has an array of winning combos" do
	end

	it "exits the game when player types 'exit' " do
	end

	it "increments turn_number after a Player moves" do
	end

	it "switches turn to other Player after the current Player moves" do
	end

	it "starts checking for win only on the 5th turn" do
	end

	it "ends in win if a Player has a winning combo (3 in a row)" do
	end

	it "ends in a draw if the game reaches 9 turns" do
	end
end
