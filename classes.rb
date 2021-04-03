require 'io/console'
require "./methods.rb"

#############################################################################
class Grid
	attr_reader :cols, :rows, :grid
	
	def initialize
		@cols = 45
		@rows = 20
		@grid = Array.new
		for i in 0..@rows-1
			@grid[i] = Array.new
			for j in 0..cols-1
				@grid[i][j] = nil
			end
		end
	end

	def place(x,y,v)
		@grid[x][y] = v
		@room.place
	end
end

#############################################################################
class Room
	attr_accessor :room, :grid

	INSTANCES = []

	def initialize
		@grid = Grid.new
		room_header = ("\t" + "╔" + "═"*@grid.cols+ "╗\t")*2+"\n"
		room_footer = ("\t" + "╚" + "═"*@grid.cols+ "╝\t")*2+"\n"
		room_wall_top = ("\t║  ╔" + "═"*(@grid.cols-6)+ "╗  ║\t")*2+"\n"
		room_wall_bottom = ("\t║  ╚" + "═"*(@grid.cols-6)+ "╝  ║\t")*2+"\n"

		@room = Array.new
		@room.push room_header
		@room.push (("\t║   " + " "*(@grid.cols-6) + "   ║\t")*2+"\n")
		@room.push room_wall_top
		for i in 1..(@grid.rows)
			@room.push (("\t║  ║" + " "*(@grid.cols-6) + "║  ║\t")*2+"\n")
		end
		@room.push room_wall_bottom
		@room.push (("\t║   " + " "*(@grid.cols-6) + "   ║\t")*2+"\n")
		@room.push room_footer
		@room
	end

	def test
		rp = Array.new
		@room.map do |row|
			rp.push(row.length)
		end
		print rp
	end

	def place(loc,chars,colour=nil)
		loc[0] = clamp(loc[0], 0, @grid.rows+4)
		loc[1] = clamp(loc[1], 1, @grid.cols+10)
		ch_arr = chars.split("\n")
		puts ""
		for i in 0..ch_arr.length-1
			roomloc = @room[loc[0]+i].dup
			@room[loc[0]+i] = @room[loc[0]+i][0..loc[1]]
			@room[loc[0]+i] += ch_arr[i]#.colorize(colour)
			@room[loc[0]+i] += roomloc[loc[1]+ch_arr[i].length+1..]
		end
		# INSTANCES
	end
	
	# def place_message(loc,chars,colour=nil)
	# 	loc[0] = clamp(loc[0], 0, @grid.rows+4)
	# 	loc[1] = clamp(loc[1], 1, @grid.cols+10)
	# 	ch_arr = chars.split("\n")
	# 	puts ""
	# 	for i in 0..ch_arr.length-1
	# 		p ch_arr[i]
	# 		roomloc = @room[loc[0]+i].dup
	# 		@room[loc[0]+i] = @room[loc[0]+i][0..loc[1]]
	# 		@room[loc[0]+i] += ch_arr[i]#.colorize(colour)
	# 		@room[loc[0]+i] += roomloc[loc[1]+ch_arr[i].length+1..]
	# 	end
	# 	# INSTANCES
	# end

	def draw
		puts @room.join
		p @room[5].length
		# puts @room.join
	end

	def get(row, col)
		@room[row][col]
	end
end

#############################################################################
class Player
	attr_accessor :health, :name, :credits, :karma, :wallace_credits

	def initialize
		@health = 100
		@karma = 0
		@credits = 0
	end
end

class Enemy
	attr_accessor :health
	attr_reader :name, :credits, :healthpacks, :attack

	def initialize(name,health=20,credits=(rand()*250).round,healthpacks=(rand()*5 + 1).round)
		@name = name
		@health = health
		@attack = (rand()*5).round
		@healthpacks = healthpacks
		@credits = credits
	end
end

class Interactible < String
	def initialize(string)
		@string = string
	end
end