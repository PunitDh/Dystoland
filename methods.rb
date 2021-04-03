# $wall_buff = 3

#############################################################################
def count_em(string, substring)
	string.scan(/(?=#{substring})/).count
end

#############################################################################
def clamp(val, min, max)
	return min if val <= min
	return max if val >= max
	return val
end

# #############################################################################
# def read_char
# 	STDIN.echo = false
# 	STDIN.raw!
  
# 	input = STDIN.getc.chr
# 	if input == "\e" then
# 	  input << STDIN.read_nonblock(3) rescue nil
# 	  input << STDIN.read_nonblock(2) rescue nil
# 	end

#   ensure
# 	STDIN.echo = true
# 	STDIN.cooked!
  
# 	return input
# end

# #############################################################################
# def show_single_key
# 	c = read_char
  
# 	up = 0
# 	down = 0
# 	left = 0
# 	right = 0

# 	case c
# 	when " "
# 	  puts "SPACE"
# 	when "\t"
# 	  puts "TAB"
# 	when "\r"
# 	  puts "RETURN"
# 	when "\n"
# 	  puts "LINE FEED"
# 	when "\e"
# 	  puts "ESCAPE"
# 	when "\e[A"
# 	  puts "UP ARROW"
# 	  up = 1
# 	when "\e[B"
# 	  puts "DOWN ARROW"
# 	  down = 1
# 	when "\e[C"
# 	  puts "RIGHT ARROW"
# 	  right = 1
# 	when "\e[D"
# 	  puts "LEFT ARROW"
# 	  left = 1
# 	when "\177"
# 	  puts "BACKSPACE"
# 	when "\004"
# 	  puts "DELETE"
# 	when "\e[3~"
# 	  puts "ALTERNATE DELETE"
# 	when "\u0003"
# 	  puts "CONTROL-C"
# 	  exit 0
# 	when /^.$/
# 	  puts "SINGLE CHAR HIT: #{c.inspect}"
# 	else
# 	  puts "SOMETHING ELSE: #{c.inspect}"
# 	end

# 	return [right-left, down-up]
# end

def tmpgets
	tmp = gets
end

def cutscenedraw(name)
	Image.print(name)
	# puts "\n"*5
	Message.print(name)
	tmpgets	
end


def winsize
    IO.console.winsize
    rescue LoadError
    Integer(`tput co`)
end

def cutscenes(messages)
	messages.cycle(1) { |message| cutscene(message) }
end

def cutscene(message)
	maximum_length = winsize()[1].to_i - 20
	str = Array.new
	if (message.length > maximum_length)
		for i in 0..((message.length/maximum_length))
			pmsg = message[..(i*maximum_length)]
			lastspace = pmsg.rindex(" ")
			message[lastspace] = "\n" if not lastspace.nil?
		end
	end
	str = message.split("\n")

	for i in 0..str.length-1
		puts str[i].to_s
	end
	tmpgets
end

def printprompt(message)
	puts message
	tmpgets
end