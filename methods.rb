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

def insult
	insults = ["You will not get away with this, you gleeking flap-mouthed haggard",
		"Don't you need a license to be that ugly?",
		"I bet your brain feels as good as new, seeing that you've never used it.",
		"I don't know what makes you so stupid, but it really works!",
		"If you had another brain, it would be lonely.",
		"Did they make the Idiot-bot blueprints out of you?",
		"You will go no further than this, maggot-pie!",
		"How did you get this far, turd-goblin?",
		"Don't you have a terribly empty feeling - in your skull?",
		"Learn from your parents' mistakes - use birth control!",
		"Turn yourself in, now!",
		"I bet your mother has a loud bark!",
		"Do you still love nature, despite what it did to you?",
		"Keep talking, someday you'll say something intelligent.",
		"I heard you went to have your head examined but the doctors found nothing there.",
		"I'm going to rupture your evil face with a brick",
		"Begone before I break your stinking spine with an anvil",
		"I'm going to make you cry like a schoolgirl",
		"Did you know you have receding gums?",
		"After I'm done with you, you're going to wish you were never born",
	].sample
end

def showarmory(player,prompt,convertdisabled=false)
	lastselected = 1
	hrequest = nil
	prices = {"gun": 12000, "healthpack": 800, "cipher": 100}
	begin
		puts ""
		puts (" You have: " + (player.credits.to_s + " credits").yellow).center(100)
		  options = {
		  "Buy Gun "  + "(#{prices[:gun]} Credits)".yellow  => 1,
		  "Buy healthpacks " + "(#{prices[:healthpack]} Credits)".yellow => 2,
		#   "Purchase Ciphers " +  "(#{prices[:cipher]} Credits)".yellow => 3,
		#   "View Powers" => 4,
		  { name: "Purchase Ciphers".light_black, disabled: "(Not yet available)".light_black } => 3,
		  { name: "View Powers".light_black, disabled: "(Not yet available)".light_black } => 4,
		  { name: "Convert garbage data".light_black, disabled: "(Not yet available)".light_black } => 5,
		  "[Exit Armory]" => 6
		  }
		  if not convertdisabled
			options["Purchase Ciphers " +  "(#{prices[:cipher]} Credits)".yellow] = options.delete options.key(3)
		  	options["View Powers"] = options.delete options.key(4)
			options["Convert garbage data"] = options.delete options.key(5)
			options["[Exit Armory]"] = options.delete options.key(6)
		  end

		 request = promptchoices(prompt, "\n Choose your option:", options, lastselected)
		 lastselected = request
		case request
		  when 1
			if player.gundamage < 3.5
				case promptchoices(prompt, "\n Are you sure you want to purchase a gun for #{prices[:gun]} credits?", {"Yes"=>1, "No"=>2})
				when 1
					if player.gundamage < 3.5
						if player.credits >= prices[:gun]
							player.credits -= prices[:gun]
							player.gundamage = 3.5
							puts "\n\n You have purchased a gun for #{prices[:gun]} credits.\n\n"
						else
							puts "\n\n You do not have enough credits to purchase this item.\n\n"
						end
					end
				end
			else
				puts "\n\n You have already purchased a gun.\n\n"
			end
		  when 2
			case promptchoices(prompt, "\n Are you sure you want to purchase 1 healthpack for #{prices[:healthpack]} credits?", {"Yes"=>1, "No"=>2})
			when 1
			  if player.credits >= prices[:healthpack]
				player.credits -= prices[:healthpack]
				player.healthpacks += 1
			  else
				puts "\n\n You do not have enough credits to purchase this item.\n\n"
			  end
			end
		  when 3
			case promptchoices(prompt, "\n Are you sure you want to purchase 1 cipher for #{prices[:cipher]} credits?", {"Yes"=>1, "No"=>2})
			when 1
			  if player.credits >= prices[:cipher]
				player.credits -= prices[:cipher]
				player.ciphers += 1
			  else
				puts "\n\n You do not have enough credits to purchase this item.\n\n"
			  end
			end
		  when 4
			p player.powers
			# do this
		  when 5
			begin
				gdata = promptchoices(prompt, "\n Choose which cipher to convert: ", [player.garbagedata, "[Exit]"].flatten)
				if not gdata == "[Exit]"
					player.garbagedata.delete(gdata)
					decipher = [gdata].pack("B*").to_s
					powerval = decipher.count("\\^aeiou")+decipher.length*decipher.count("\\^aeiou")
					puts "\n\n You have gained the following power: " + decipher + ", " + powerval.to_s
					player.powers << [decipher, powerval]
				end
			end until gdata == "[Exit]"
			tmpgets
		  when 6
			hrequest = promptchoices(prompt, "\n\nAre you sure you want to exit the Armory?", {"Yes" => 1, "No" => 2})
		end
	  end until hrequest == 1
end

def enemyencounter(player, prompt, enemy, health=20, garbagadataunlock=true, initialquote=nil)
	e = Enemy.new(enemy,health)
    cutscene "\n\n\n\n\n\n Your path is being blocked by: #{e.name.capitalize.light_magenta}"
	Image.print(e.name)
	tmpgets
	cutscene "\n #{e.name.capitalize} says: \"#{(initialquote.nil?) ? insult() : initialquote}\"\n"
	cutscene " You have entered "+"Battle Mode".light_magenta + "!"
	attackround = 0
	eattackmultiplier = 1
	criticalstrike = 1
	request = nil
	fleeattempt = false
	lastselected = 1
    begin
        puts "\n\t\t #{e.name.capitalize}'s health: #{e.health}/#{e.maxhealth}   " + ("█".red)*((e.health/5).ceil)
        puts "\t\t Your Health: #{player.health}/#{player.maxhealth}   " + ("█".green)*((player.health/5).ceil)
        request = promptchoices(prompt, "Your move:", {"Attack #{e.name.capitalize}" => 1, "Throw Grenade (Qty: "+player.grenades.to_s.light_red+")" => 2, "Heal (Qty:"+player.healthpacks.to_s.light_blue+")" => 3, "Hide from #{e.name.capitalize}" => 4, "Run away" => 5}, lastselected)
		lastselected = request
        
		case request
			when 1
				criticalstrike = rand(1.5..3.5) if rand() > 0.6
				attackdmg = (rand() *5 * criticalstrike * player.gundamage).ceil
				puts (attackdmg < 1) ? "\n\n You attack #{e.name.capitalize} and miss." : "\n\n You attack #{e.name.capitalize} and cause #{attackdmg} damage."
				puts " \n Critical Strike!!" if (criticalstrike > 1 and attackdmg >= 10)
				e.health -= attackdmg
				criticalstrike = 1
			when 2
				if player.grenades > 0
					attackdmg = (rand(10..24) * rand(0.9..1.1)).ceil
					puts "\n You throw a grenade and deal #{attackdmg} damage to #{e.name.capitalize}."
					e.health -= attackdmg
					player.grenades -= 1
				else
					puts "\n You fumble around in your backpack to find a grenade, but find none."
				end
			when 3
				if (player.health == player.maxhealth)
					puts "\n You are already at max health."
				else
					if (player.healthpacks > 0)
						puts "\n You use 1 healthpack from your backpack and gain 10 health."
						player.healthpacks -= 1
						player.health = [player.maxhealth, player.health + 10].min
					else
						puts "\n You fumble around in your backpack to find a healthpack, but find none."
					end
				end
			when 5
				puts "\n You turn on your heels and attempt to escape..."
				tmpgets
				fleeattempt = true if rand() > 0.75
				puts "\n #{e.name.capitalize} yells: " + ((fleeattempt) ? "\"Yes, yes, run away, little mouse...\"" : "\"Stand and fight me, coward\"")
				puts "\n Flee attempt failed..." if not fleeattempt
		end
		
		tmpgets
		break if e.health <= 0
		if rand() > 0.6 or attackround == 0
			puts " #{e.name.capitalize} is " +  ["annoyed","bitter","enraged","exasperated","furious","impassioned","indignant","irritated","irritable","offended","outraged","resentful"].sample + "."
			tmpgets
			if rand() > 0.8
				cutscene " #{e.name.capitalize} #{["gears up", "readies himself"].sample} for #{["a destructive","a ruinous","a disastrous","a catastrophic","a calamitous","a cataclysmic","a pernicious","a noxious","a harmful","a damaging","an injurious","a hurtful"].sample} attack."
				eattackmultiplier = rand(1.5..2.5)
			end
		end

		enemydmg = (rand()*e.attack * eattackmultiplier).ceil
		puts (enemydmg < 1) ? "\n #{e.name.capitalize} attacks you and misses." : "\n #{e.name.capitalize}'s attack #{["causes", "deals"].sample} #{enemydmg} damage."
		puts " Ouch!!" if eattackmultiplier > 1 and enemydmg >= 10
        player.health -= enemydmg
		eattackmultiplier = 1
		tmpgets
		break if player.health <= 0
		attackround += 1

		Image.print(e.name)
		cutscene "\n #{e.name.capitalize} says: \"#{insult()}\"\n"
    end until (e.health <= 0 or (request == 5 and fleeattempt==true))

	if (player.health <= 0)
		puts "\n\n"
		puts "You have died!".center(100)
		puts "\n\n\n"
		exit
	end

	if (not request == 5)
		puts ("\t\t\tYou have " + ["destroyed","defeated","crushed","conquered","beaten"].sample + ": #{e.name.capitalize}!")
		puts ("\t\t\tYou have gained: " + (e.healthpacks.to_s + " healthpack(s)").light_blue)
		player.healthpacks += e.healthpacks
		puts ("\t\t\tYou have gained: " + (e.credits.to_s + " credits").yellow)
		player.credits += e.credits
		if e.grenades > 0
			puts "\t\t\tYou have gained: " + (e.grenades.to_s + " grenades").light_red
			player.grenades += e.grenades
		end
		if (garbagadataunlock)
			tmpgets
			garbagedata = random_word().flatten
			garbagedatachoices = garbagedata.dup
			garbagedatachoices.push("[Collect All]","[Exit]")
			begin 
				puts "\n The enemy has dropped the following garbage data: \n"
				gdata = promptchoices(prompt," Choose which data to collect or press [Collect All]",garbagedatachoices)
				garbagedatachoices.delete(gdata)
				player.garbagedata << gdata unless (gdata=="[Exit]" or gdata =="[Collect All]")
				player.garbagedata << garbagedatachoices[0..(garbagedatachoices.length-2)] if gdata =="[Collect All]"
				player.garbagedata.flatten!
			end until (gdata=="[Exit]" or gdata =="[Collect All]")
		end
	else
		puts "\n You have fled the battle."
	end
	
	tmpgets
	puts "\n\n\t\t\tYour stats: "
	puts "\t\t\t - Health: "+"#{player.health}".light_green
	puts "\t\t\t - Credits: "+"#{player.credits}".yellow
	puts "\t\t\t - Healthpacks: "+"#{player.healthpacks}".light_blue
	puts "\t\t\t - Grenades: "+"#{player.grenades}".light_blue
	tmpgets
end

def random_word()
	words = ["precede","panic","delete","borrow","large","sympathetic","filter","swarm","crossing","amputate","slap","hero","spell","electronics","head","bill","charismatic","beat","census","full","amuse","pound","institution","behead","ostracize","tough","progress","satisfied","flag","fascinate"]
	r = (rand()*5 + 1).floor
	a = []
	r.times do
		w = words.sample
		words.delete(w)
		a << w.unpack("B*")
	end
	return a
end


def promptchoices(prompt, question, choices, lastselected=1)
    prompt.select(question, choices, show_help: :never, cycle: true) 
	# do |menu|
	# 	menu.default (choices.key(lastselected)[:disabled]) ? lastselected : 1
	# 	choices.each do |key,value|
	# 		menu.choice key, value
	# 	end
	# end
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