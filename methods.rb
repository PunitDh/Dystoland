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

def enemyencounter(player, prompt, enemy, health=20)
	e = Enemy.new(enemy,health)
    cutscenes ["\n\n\n\n\n\nYour path is being blocked by: #{e.name.capitalize}", "You have entered Battle Mode!"]
	# attackadjectives = ["a destructive","a ruinous","a disastrous","a catastrophic","a calamitous","a cataclysmic","a pernicious","a noxious","a harmful","a damaging","an injurious","a hurtful"]
	# attackverbs = ["causes", "deals"]
	# attackinviters = ["gears up", "readies himself"]
	attackround = 0
	eattackmultiplier = 1
	criticalstrike = 1

    begin
        Image.print(e.name)
        puts "\n\t\t #{e.name.capitalize} has #{e.health}/#{e.maxhealth} health: " + ("█".red)*((e.health/5).ceil)
        puts "\t\t Your Health: #{player.health}/#{player.maxhealth}: " + ("█".green)*((player.health/5).ceil)
        request = promptchoices(prompt, "Your move:", {"Attack" => 1, "Throw Grenade (Qty: "+player.grenades.to_s.light_red+")" => 2, "Heal (Qty:"+player.healthpacks.to_s.light_blue+")" => 3, "Hide" => 4, "Run away" => 5})
        
		case request
			when 1
				criticalstrike = 2 if rand() > 0.6
				attackdmg = ((rand()*5).round) * criticalstrike * player.gundamage
				puts (attackdmg < 1) ? "\n\n You attack #{e.name.capitalize} and miss." : "\n\n You attack #{e.name.capitalize} and cause #{attackdmg} damage."
				puts " \n Critical Strike!!" if (criticalstrike > 1 and attackdmg >= 10)
				e.health -= attackdmg
				criticalstrike = 1
			when 2
				if player.grenades > 0
					attackdmg = rand(10..24)
					puts "\n You throw a grenade and deal #{attackdmg} damage to #{e.name.capitalize}."
					e.health -= attackdmg
					player.grenades -= 1
				else
					puts "\n You fumble around in your backpack to find a grenade, but find none."
				end
			when 3
				if (player.healthpacks > 0)
					puts "\n You use 1 healthpack from your backpack and gain 20 health."
					player.healthpacks -= 1
					player.health = [player.maxhealth, player.health + 20].min
				else
					puts "\n You fumble around in your backpack to find a healthpack, but find none."
				end
		end
		
		tmpgets
		break if e.health <= 0
		if rand() > 0.6 or attackround == 0
			puts " #{e.name.capitalize} is " +  ["annoyed","bitter","enraged","exasperated","furious","impassioned","indignant","irritated","irritable","offended","outraged","resentful"].sample + "."
			tmpgets
			if rand() > 0.8
				cutscene " #{e.name.capitalize} #{["gears up", "readies himself"].sample} for #{["a destructive","a ruinous","a disastrous","a catastrophic","a calamitous","a cataclysmic","a pernicious","a noxious","a harmful","a damaging","an injurious","a hurtful"].sample} attack."
				eattackmultiplier = 2
			end
		end

		enemydmg = ((rand()*e.attack).round) * eattackmultiplier
		puts (enemydmg < 1) ? "\n #{e.name.capitalize} attacks you and misses." : "\n #{e.name.capitalize}'s attack #{["causes", "deals"].sample} #{enemydmg} damage."
		puts " Ouch!!" if eattackmultiplier > 1 and enemydmg >= 10
        player.health -= enemydmg
		eattackmultiplier = 1
		tmpgets
		break if player.health <= 0

		attackround += 1
    end until e.health <= 0

	puts "You have "+["destroyed","defeated","crushed","conquered","beaten"].sample+": #{e.name.capitalize}!"
    puts "You have gained: " + (e.healthpacks.to_s + " healthpack(s)").light_blue
	player.healthpacks += e.healthpacks
    puts "You have gained: " + (e.credits.to_s + " credits").yellow
	player.credits += e.credits
	if e.grenades > 0
		puts "You have gained: " + (e.grenades.to_s + " grenades").light_red
		player.grenades += e.grenades
	end
	tmpgets
	puts "\n\n\t\tYour stats: "
	puts "\t\t - Health: "+"#{player.health}".light_green
	puts "\t\t - Credits: "+"#{player.credits}".yellow
	puts "\t\t - Healthpacks: "+"#{player.healthpacks}".light_blue
	puts "\t\t - Grenades: "+"#{player.grenades}".light_blue
	tmpgets
end

def promptchoices(prompt, question, choices)
    prompt.select(question, choices, show_help: :never)
end

def quote(message)
	"\"" + message.to_s + "\""
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