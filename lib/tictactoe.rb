#!/usr/bin/env ruby
require_relative 'player'

class Ttt
	attr_accessor :grid

	def initialize
		@grid = {
		  a1:"a1",a2:"a2",a3:"a3",
		  b1:"b1",b2:"b2",b3:"b3",
		  c1:"c1",c2:"c2",c3:"c3"
		}

	    @winning_combos = [      
	      [:a1,:a2,:a3],
	      [:b1,:b2,:b3],
	      [:c1,:c2,:c3],
	      [:a1,:b1,:c1],
	      [:a2,:b2,:c2],
	      [:a3,:b3,:c3],	      
	      [:a1,:b2,:c3],
	      [:a3,:b2,:c1]
	    ]

		@player1 = Player.new(get_name)
		@player2 = Player.new(get_name)

		@current_player = @player1  # initially start with player1 starting
	end	

	def get_name
		puts "What is player's name?"
		return gets.chomp
	end
	
	def game_start		
		game_over = false
		turn_number = 1
		
		while game_over != true
			draw_grid

			player_input = @current_player.move(@grid)

			if player_input == 'exit'
				break  							# inelegant, refactor to game_over = true at some point
			elsif @current_player == @player1
				@grid[player_input] = 'x'
			else
				@grid[player_input] = 'o'
			end

			turn_number += 1

			# start checking for win only after 5th move
			if turn_number >= 5 && turn_number < 9
				win = check_for_win

				if win == true
					draw_grid
					puts "#{@current_player.name} wins!"
					break  
				end
			elsif turn_number == 9
				puts "Draw!"
				break
			end

			switch_turn
		end
		
		exit
	end

	def check_for_win
		if @current_player == @player1
			to_check = 'x'
		else
			to_check = 'o'
		end

		@winning_combos.each do |combo|
			marks_in_a_row = 0  					# new count for each combo

			combo.each do |grid_spot|
				if @grid[grid_spot] == to_check
					marks_in_a_row += 1
				else
					break 							# return immediately, no point checking the rest of this combo
				end

				if marks_in_a_row == 3
					return true
				end
			end
		end

		return false  								# none of the combos were a winner
	end

	def draw_grid
		puts "\n"
		puts "#{@player1.name} marks with 'x'. #{@player2.name} marks with 'o'."
		puts "#{@current_player.name}'s turn."
		puts "\n"
		puts "     #{@grid[:a1]} | #{@grid[:a2]} | #{@grid[:a3]}"
		puts "     -------------"
		puts "     #{@grid[:b1]} | #{@grid[:b2]} | #{@grid[:b3]}"
		puts "     -------------"
		puts "     #{@grid[:c1]} | #{@grid[:c2]} | #{@grid[:c3]}"
		puts "\n"
	end 	

	def switch_turn  
		if @current_player == @player1
			@current_player = @player2  
		else
			@current_player = @player1
		end
	end
end	

tictactoe = Ttt.new
tictactoe.game_start