class Player
	attr_accessor :name

	def initialize(name)
		@name = name
		@valid_inputs = [:a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3]
	end 

	# returns 'exit' or symbol
	def move(grid) 
		puts "#{self.name}, choose a spot on the grid(ex: a1), or 'exit' to quit: "
		pinput = gets.chomp

		while pinput != 'exit'	
			pinput_sym = pinput.to_sym  # change input to symbol

			if grid[pinput_sym] == 'x' || grid[pinput_sym] == 'o'
				print "That spot is already taken. Try again. "
			elsif grid[pinput_sym] == ''
				print "You didn't enter anything."
			else
				if (@valid_inputs).member?(pinput_sym)
					return pinput_sym
				else
					puts "Incorrect input. Please try again."
					puts "\n"
				end
			end

			puts "#{self.name}, choose a spot on the grid(ex: a1), or 'exit' to quit: "
			pinput = gets.chomp  # no satisfactory input, try again			
		end

		return 'exit'
	end
		
end