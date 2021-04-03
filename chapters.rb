def chapter_setting(player,prompt)
    puts "Setting".light_green
    puts "-----------------------".light_green
    # Image.print("robotsconqueringearth")
    printprompt "The year is 2155. Humanity has been taken over by robots."
  
    printprompt "You are a member of the Resistance movement named the Retakers."
    
    cutscene "You have been fighting tirelessly for over 20 years to retake the planet back from the grasp of the robots."
  
    begin
      puts "What is your name?".light_green
      print "Name: "
      player.name = gets.chomp
  
      print "Your designation is: Lieutenant-Sargeant #{player.name}.\n\n"
  
      choices = {"Yes" => 1, "No" => 2}
      request = prompt.select("Are you okay with this?\n", choices, show_help: :never)
    end while request == 2  
end

def chapter_one(player,prompt)
    puts "\n\nChapter 1 - The phone call".light_green
    puts "-----------------------".light_green
  
    cutscene "Your base is located deep within the Brasshall Forest, where no robot has set foot in."
  
    cutscene "\nOne day, you get a phone call."
  
    Image.print("cellphone")
  
    cutscene "*Ring Ring*"
    cutscene "*Ring Ring*"
  
    cutscene "\nYou answer the phone."
    
    # cutscene " a dying elderly man approaches you."
  
    cutscene "\"*Cough cough*. Please, sir. You must help me.\""
  
    cutscene "It sounds like it is the voice of a dying old man."
  
    choices = {"Who is this?" => 1, "How did you get this number?" => 2}
    request = prompt.select("Say:", choices, show_help: :never)
    
    # cutscene "He tells you that he has a robot named Cyb, and his dying wish is to have Cyb's memory erased."
  
    cutscene "\"*Cough cough*,\" says the old man. \"My name is Wallace, sir. I got your number through your old co-worker Samuel.\""
  
    choices = {"What can I do for you?" => 1, "How can I help?" => 2}
    request = prompt.select("Say:", choices, show_help: :never)
  
    cutscene "\n\"Please, sir. You must help me. Samuel spoke highly of you and I know of your reputation.\""
  
    cutscene "\"You must help me. *cough cough*\""
  
    cutscene "\"Please check your phone. I'm about to send you a photograph.\""
  
    cutscene "[BLEEP] You have received a message."
  
    choices = {"[Open the message]" => 1}
    request = prompt.select("", choices, show_help: :never)
    cutscene "It's a photograph."
    Image.print("Cyb")
  
    choices = {"What is this?" => 1, "Who is this?" => 2}
    request = prompt.select("You say...\n", choices, show_help: :never)
  
    cutscene "\"This is Cyb,\" says Wallace. \"Cyb is a robot.\""
    
    printprompt "\"I built Cyb myself.\""
  
    printprompt "\"*Cough cough*\""
  
    printprompt "\"*Cough cough*\""
  
    printprompt "\"I wish to have Cyb's memory erased.\""
  
    printprompt "\"I see,\" you say."
  
    choices = {"[Ask him why]" => 1, "[Don't ask him why]" => 2}
    request = prompt.select("", choices, show_help: :never)
  
    printprompt "\"Why do you wish to have his memory erased?\" you ask him." if request == 1
  
    printprompt "\"Cyb has been in my family for almost two decades,\" he says. \"*Cough cough*\""
    printprompt "\"I built Cyb with my own hands to protect me and my family.\""
    printprompt "\"But he knows too much. I fear that after my death, he will fall into the wrong hands.\""
  
    choices = {"[Say nothing]" => 1, "[Ask him why he can't you do this himself]" => 2}
    request = prompt.select("", choices, show_help: :never)
  
    printprompt "\"Why can't you do this yourself?\" you ask him." if request == 2
    
    printprompt "\"Lieutenant-Sargeant #{player.name}, I know of your reputation. You disabled the Arch-Gamma Megaframe two years ago.\""
  
    choices = {"How did you know about that?" => 1, "Yes, that, I did." => 2}
    request = prompt.select("Say:", choices, show_help: :never)
  
    printprompt "\"How did you know about that?\" you ask him." if request == 1
  
    printprompt "\"Your old colleague Samuel mentioned it.\"" if request == 1
  
    printprompt "\"Yes, that was quite a mission we undertook,\" you say" if request == 2
  
    printprompt "\"*Cough cough*\""
    printprompt "\"Disabling the Arch-Gamma Megaframe was a major victory for humanity. You stopped an invasion from happening, and countless human lives were saved that day.\""
  
    printprompt "\"There is nobody more in this world more suited for this task than you are. *Cough cough*\""
  
    printprompt "\"That's why I want you, and nobody else, to do this for me.\""
  
    printprompt "\"Please do a complete memory wipe on Cyb.\""
  
    choices = {"I see." => 1, "Okay." => 2}
    request = prompt.select("Say:", choices, show_help: :never)
  
    # printprompt(request +"\n")
  
    printprompt "\n\n\"I will obviously make it worth your while,\" says Wallace."
  
    printprompt "\"For your troubles, I will give you 25,000 credits.\""
  
    printprompt "\"Will you do it?\""
  
    choices = {"Well, that's quite an offer, Wallace. Yes, I'll take it." => 1, "Actually, I want 50,000." => 2}
    request = prompt.select("Say:", choices, show_help: :never)
    
    player.wallace_credits = 25000 if request == 1
  
    if request == 2
      printprompt "\"Actually, Wallace. I can do it for no less than 50,000,\" you say."
      printprompt "\"*Cough cough* my dear boy,\" says Wallace. \"You drive a hard bargain. Do you really want to gamble with a dying old man's life?\""
      choices = {"You're right, I'm sorry, Wallace. Let's keep it at 25,000" => 1, "50,000 is my price. Take it or leave it." => 2}
      request = prompt.select("Say:", choices, show_help: :never)
      if request == 2
        printprompt "\"This is a task that may put my life and other's lives at risk. 50,000 is my price,\" you say."
        printprompt "\"Well, that's quite an ask,\" says Wallace. \"Fine. Let's do 50,000.\""
        printprompt "\"I will pay you 25,000 now and the rest when the task is done.\""
        printprompt "You have gained: "+"+25000 credits".yellow
        player.credits += 25000
        player.wallace_credits = 50000
        choices = {"Thank you, Wallace. I won't let you down." => 1, "Actually, that was too easy, old man. Now I want 70,000." => 2}
        request = prompt.select("Say:", choices, show_help: :never)
        if request == 2
          printprompt "\n\"I knew you were a hard man, Mr #{player.name}. But I didn't know you were also pompous and self-indulgent. Do you seriously want to bargain with me up to 70,000?"
          choices = {"You're right. Sorry, I don't." => 1, "70,000 or no deal." => 2}
          request = prompt.select("Say:", choices, show_help: :never)
          printprompt "You're right, sorry, Wallace. The needs of humanity far outweigh anything else. Let's settle at 50,000" if request == 1
          if request == 2
            printprompt "70,000 or no deal, Wallace."
            printprompt "Fine, you can have 70,000 credits. I'll give you the rest of the money after the task is done. \""
            player.wallace_credits = 70000
            printprompt "You have lost: " + "-2 karma points.".light_red
            player.karma -= 2
          end
  
        end
      end
    end
    printprompt "\"Well, now you know how important this is to me,\" Wallace says."
    printprompt "\"Cyb is not like other robots.\""
    printprompt "\"Cyb is smarter and stronger than most robots on the planet.\""
    printprompt "\"I built Cyb to protect myself and my family.\""
    printprompt "\"Ever since the Robot Revolution, it has become increasingly necessary to have robots on your side.\""
    printprompt "\"Unfortunately, this is not a simple a task where you hack into his subsystem and press the Delete button.\""
    printprompt "\"Cyb is a modified version of the Cybertron-8X110, the same robot that the Cybernetics use for law enforcement operations\""
    printprompt "\"Which means, even if you delete his memory, he will still have backup copies in the Cloud.\""
    printprompt "\"You will need a special device called the K-311 Gamma Siphoner.\""
    printprompt "\"This is the only device capable of disabling the robot and deleting all memories from the Cloud.\""
    printprompt "\"I'm going to have a drone deliver the K-311 Gamma Siphoner to you in the next 2 hours.\""

    begin
      choices = {"Great. Thank you, Wallace." => 1, "[Tell him you don't need it]" => 2}
      request = prompt.select("What do you do?\n".light_green, choices, show_help: :never)
      printprompt "\n\"Don't be a fool,\" says Wallace. \"You wouldn't last 2 days without the device.\"" if request == 2
    end while request == 2
    printprompt "\"Great. Now we're on track.\""
    printprompt "\"Cyb is located deep within the hearts of the Lambda Sector.\""    
    printprompt "\"He has built himself a home in the Museum of Rich History and Technology.\"" 
    printprompt "\"The place is a fortress. It is swarming with all sorts of attack droids, Cyebertrons, Hackerborgs, and god-only-knows-what.\""
    printprompt "\"You will need to arm yourself to the teeth in order to get there.\""
    printprompt "\"I will be in touch soon. Thank you, Lieutenant-Sargeant #{player.name}.\""
    printprompt "*click*"
    printprompt "The phone goes silent..."
end

def chapter_two(player,prompt)
    puts "\n\nChapter 2 - In my quarters".light_green
    puts "-----------------------".light_green
    tmpgets

    printprompt "It is a bright, sunny day."
    printprompt "The clock is just about to strike 9:00."
    printprompt "The milktoast is soggy, but filling."
    printprompt "*Knock, knock*"
    printprompt "*Knock, knock*"
    choices = {"Yes?" => 1, "[Open the door]" => 2}
    request = prompt.select("Say:", choices, show_help: :never)
    if request == 1  
        printprompt "You say, \"Yes, who is it?\""
        printprompt "\"It is Private Kenneth, sir\"."
        printprompt "\"Come on in then, Private.\""
        printprompt "The door opens."
    elsif request == 2
        printprompt "You open the door."
        printprompt "It is Private Kenneth."  
    end
    printprompt "\"Sir, the preparations are ready,\" he says."
    printprompt "\"We are simply waiting for you, sir.\""
    printprompt "\"At ease, Private,\" you tell him."
    printprompt "\"Have the wreaths been arranged exactly as we had agreed?\" you ask."
    printprompt "\"Yes, sir,\" says Private Kenneth. \"And the ...\""
    printprompt "\"...the...\""
    printprompt "\"...bodies...\""
    printprompt "\"...have also been prepared the way we wanted them.\""
    printprompt "You hear a sniff."
    printprompt "\"Sir. *sniff*. I just don't believe it.\""
    printprompt "\"...Rita...\""
    printprompt "\"She...she... was so young. So... so... young...\""
    printprompt "\"She deserved much better than this...\" you say."
    printprompt "\"I...I... knew her when she used to build pillow forts...\""
    printprompt "\"...and pretend to defend herself against...\""
    printprompt "\"This is a terrible loss for us,\" you say."
    printprompt "\"...and Kevin, sir... and Paula...and...and...\""
    printprompt "\"We are all devastated by this loss,\" you comfort him."
    printprompt "\"...and...Stefano as well... \""
    printprompt "You notice a tear roll down Private Kenneth's eye."
    printprompt "\"These were all good people who shouldn't have lost their lives,\" you say."
    printprompt "\"The robots have much to answer for!!!\" snarls Private Kenneth angrily."
    printprompt "\"If I die the same death, I want to take down at least a hundred of those tin-monkeys before I go out!\""
    printprompt "\"Easy there, Private,\" you say. \"It is not worth to simply throw your life away out of anger.\""
    printprompt "\"But...they...killed...Rita...sir...\""
    printprompt "\"Yes, I know, Private,\" you say. \"But one living soldier is worth fifty dead robots to me.\""
    printprompt "\"Y...yes, sir,\" says Private Kenneth."
    printprompt "\"Come on, now,\" you say. \"I'd rather not be late for the funeral.\""
    printprompt "You both walk down towards the opening in the woods."
    printprompt "Six caskets lay side by side."
    printprompt "The shimmering sun is shining upon the caskets through openings in the tree branches."
    printprompt "A crowd of about 20 are gathered around the caskets, looking silent and mournful"
    printprompt "A man dressed in white is standing holding a book."
    printprompt "\"We're ready to get started,\" he says."
    printprompt "\"I'll let you lead the ceremony, Father,\" you say."
    printprompt "It begins."
    printprompt "Father opens the book and starts reading."
    printprompt "\"We're gathered here today to mourn the passing of six of the bravest people we've known\""
    printprompt "\"Rita, Kevin, Paula, Stefano, Holsworth, Harvey were the bravest heroes we knew.\""
    printprompt "\"Last night, during an attack on our external compound by the ungodly machines, they were taken from us.\""
    printprompt "\"Far too early. Far too young.\""
    printprompt "Father looks up towards the sky."
    printprompt "\"Please come forth if you have a few words to say.\""
    choices = {"[Say a few words]" => 1, "[Don't say a few words]" => 2}
    request = prompt.select("", choices, show_help: :never) 
    if request == 1
        printprompt "\"Our youngest brothers and sisters were taken from us last night,\" you say."
        printprompt "\"They died while defending our external compound from the greatest threat known to mankind thus far.\""
        printprompt "\"...\""
        printprompt "There is a shiver amongst the crowd."
        printprompt "\"The machines,\" you continue..."
        printprompt "\"They do not fear us.\""
        printprompt "\"And they will never take pity on us.\""
        printprompt "\"We must honour our brethren...\""
        printprompt "\"... by... \""
    choices = {"...fighting back..." => 1, "...never giving up on each other..." => 2}  
    request = prompt.select("", choices, show_help: :never)
        printprompt (request == 1) ? "\n\"...being ever more vigilant than ever before\"" : "\n\"...supporting each other through the toughest of times... more than we have ever before\""
        printprompt "\"Each of us has to be willing to die for humanity.\""
        printprompt "\"Anything less, and they've already won...\""
        printprompt "\"You know the cost now... and you know what we're facing...\""
        printprompt "\"Be ready.\""
        printprompt "\"Be brave.\""
        printprompt "\"Be vigilant.\""
        printprompt "\"Thank you.\""
    end
    printprompt "Father picks up from there."
    printprompt "\"By the spirits, I bid you farewell,\" says the Father."
    printprompt "\"May you depart this life and find peace in the afterlife.\""
    printprompt "\"And look upon us and guide us through the utmost of difficulties.\""
    printprompt "\"Amen\""
    printprompt "\"Amen,\" the crowd murmurs, and breaks apart."
    # request = prompt.select("", choices, show_help: :never)  

end

def chapter_three(player,prompt)
    puts "\n\nChapter 3 - In the armory".light_green
    puts "-----------------------".light_green
    cutscene "\"\""

    begin
      puts "You have: " + (player.credits.to_s + " credits").yellow
      choices = {"Buy Guns" => 1, "Buy armor" => 2, "Buy healthpacks" => 3, "Buy ammo" => 4, "[Exit Armory]" => 5}  
      request = prompt.select("", choices, show_help: :never)
    end until request == 5

    e = Enemy.new("dumpsterbot")
    cutscene "Your path is being blocked by: #{e.name}"

    begin
        Image.print(e.name)
        puts "\n\t\t#{e.name.capitalize} has #{e.health} health"
        puts "\t\t Your Health: " + player.health.to_s
        choices = {"Attack" => 1, "Throw Grenade" => 2, "Heal" => 3, "Hide" => 4, "Run away" => 5}  
        request = prompt.select("Your action: ", choices, show_help: :never)
        e.health -= ((rand()*5).round) if request == 1
        player.health -= ((rand()*e.attack).round)
    end until e.health <= 0
    puts "You have gained: " + (e.healthpacks.to_s + " healthpacks").light_blue
    puts "You have gained: " + (e.credits.to_s + " credits").yellow
end