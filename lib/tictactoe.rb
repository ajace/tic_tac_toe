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

		@player1 = Player.new(get_name 'player one')
		@player2 = Player.new(get_name 'player two')

		@current_player = @player1  # initially start with player1 starting
	end	

	def get_name(pseudonym)
		puts "What is #{pseudonym}'s name?"
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
				@grid[player_input] = ' x'
			else
				@grid[player_input] = ' o'
			end

			turn_number += 1

			# start checking for win only after 5th move
			if turn_number >= 5 and turn_number < 10 and @current_player.check_for_win()
				draw_grid
				puts "#{@current_player.name} wins!"
				break  
			elsif turn_number == 10
				draw_grid
				puts "Draw!"
				break
			end

			switch_turn
		end
		
		exit
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
