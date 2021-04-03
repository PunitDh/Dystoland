def chapter_setting(player,prompt)
    puts "Setting".light_green
    puts ("-"*35).light_green
    # Image.print("robotsconqueringearth")
    cutscene "The year is 2155. Humanity has been taken over by robots."
  
    cutscene "You are a member of the Resistance movement named the Retakers."
    
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
    puts ("-"*35).light_green
  
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
    
    cutscene "\"I built Cyb myself.\""
  
    cutscene "\"*Cough cough*\""
  
    cutscene "\"*Cough cough*\""
  
    cutscene "\"I need to have Cyb's memory erased.\""
  
    cutscene "\"I see,\" you say."
  
    choices = {"[Ask him why]" => 1, "[Don't ask him why]" => 2}
    request = prompt.select("", choices, show_help: :never)
  
    cutscene "\"Why do you want his memory erased?\" you ask him." if request == 1
  
    cutscene "\"Cyb has been in my family for almost two decades,\" he says. \"*Cough cough*\""
    cutscene "\"I built Cyb with my own hands to protect me and my family.\""
    cutscene "\"But he knows too much. I fear that after my death, he will fall into the wrong hands.\""
  
    choices = {"[Say nothing]" => 1, "[Ask him why he can't you do this himself]" => 2}
    request = prompt.select("", choices, show_help: :never)
  
    cutscene "\"Why can't you do this yourself?\" you ask him." if request == 2
    
    cutscene "\"Lieutenant-Sargeant #{player.name}, I know of your reputation. You disabled the Arch-Gamma Megaframe two years ago.\""
  
    choices = {"How did you know about that?" => 1, "Yes, that, I did." => 2}
    request = prompt.select("Say:", choices, show_help: :never)
  
    cutscene "\"How did you know about that?\" you ask him." if request == 1
  
    cutscene "\"Your old colleague Samuel mentioned it.\"" if request == 1
  
    cutscene "\"Yes, that was quite a mission we undertook,\" you say" if request == 2
  
    cutscene "\"*Cough cough*\""
    cutscene "\"Disabling the Arch-Gamma Megaframe was a major victory for humanity. You stopped an invasion from happening, and countless human lives were saved that day.\""
  
    cutscene "\"There is nobody more in this world more suited for this task than you are. *Cough cough*\""
  
    cutscene "\"That's why I want you, and nobody else, to do this for me.\""
  
    cutscene "\"Please do a complete memory wipe on Cyb.\""
  
    choices = {"I see." => 1, "Okay." => 2}
    request = prompt.select("Say:", choices, show_help: :never)
  
    # printprompt(request +"\n")
  
    cutscene "\n\n\"I will obviously make it worth your while,\" says Wallace."
  
    cutscene "\"For your troubles, I will give you 25,000 credits.\""
  
    cutscene "\"Will you do it?\""
  
    choices = {"Well, that's quite an offer, Wallace. Yes, I'll take it." => 1, "Actually, I want 50,000." => 2}
    request = prompt.select("Say:", choices, show_help: :never)
    
    player.wallace_credits = 25000 if request == 1
  
    if request == 2
      cutscene "\"Actually, Wallace. I can do it for no less than 50,000,\" you say."
      cutscene "\"*Cough cough* my dear boy,\" says Wallace. \"You drive a hard bargain. Do you really want to gamble with a dying old man's life?\""
      choices = {"You're right, I'm sorry, Wallace. Let's keep it at 25,000" => 1, "50,000 is my price. Take it or leave it." => 2}
      request = prompt.select("Say:", choices, show_help: :never)
      if request == 2
        cutscene "\"This is a task that may put my life and other's lives at risk. 50,000 is my price,\" you say."
        cutscene "\"Well, that's quite an ask,\" says Wallace. \"Fine. Let's do 50,000.\""
        cutscene "\"I will pay you 25,000 now and the rest when the task is done.\""
        cutscene "You have gained: "+"+25000 credits".yellow
        player.credits += 25000
        player.wallace_credits = 50000
        choices = {"Thank you, Wallace. I won't let you down." => 1, "Actually, that was too easy, old man. Now I want 70,000." => 2}
        request = prompt.select("Say:", choices, show_help: :never)
        if request == 2
          cutscene "\n\"I knew you were a hard man, Mr #{player.name}. But I didn't know you were also pompous and self-indulgent. Do you seriously want to bargain with me up to 70,000?"
          choices = {"You're right. Sorry, I don't." => 1, "70,000 or no deal, you old geezer." => 2}
          request = prompt.select("Say:", choices, show_help: :never)
          cutscene "You're right, sorry, Wallace. The needs of humanity far outweigh anything else. Let's settle at 50,000" if request == 1
          if request == 2
            cutscene "\"70,000 or no deal, Wallace.\""
            cutscene "\"Fine! You can have 70,000 credits then! I'll give you the rest of the money after the task is done.\""
            player.wallace_credits = 70000
            cutscene "You have lost: " + "-2 karma points.".light_red
            player.karma -= 2
          end
  
        end
      end
    end
    cutscene "\"Well, now you know how important this is to me,\" Wallace says."
    cutscene "\"Cyb is not like other robots.\""
    cutscene "\"Cyb is smarter and stronger than most robots on the planet.\""
    cutscene "\"I built Cyb to protect myself and my family.\""
    cutscene "\"Unfortunately, this is not a simple a task where you hack into his subsystem and press the Delete button.\""
    cutscene "\"Cyb is a modified version of the Cybertron-8X110, the same robot that the Cybernetics use for law enforcement operations\""
    cutscene "\"Which means, even if you delete his memory, he will still have backup copies in the Cloud.\""
    cutscene "\"You will need a special device called the K-311 Gamma Siphoner.\""
    cutscene "\"This is the only device capable of disabling the robot and deleting all memories from the Cloud.\""
    cutscene "\"I'm going to have a drone deliver the K-311 Gamma Siphoner to you in the next 2 hours.\""

    begin
      choices = {"Great. Thank you, Wallace." => 1, "[Tell him you don't need it]" => 2}
      request = prompt.select("What do you do?\n".light_green, choices, show_help: :never)
      cutscene "\n\"Don't be a fool,\" says Wallace. \"You wouldn't last 2 days without the device.\"" if request == 2
    end while request == 2
    cutscene "\"Great. Now we're on track.\""
    cutscene "\"Cyb is located deep within the hearts of the Lambda Sector.\""    
    cutscene "\"He has built himself a home in the Museum of Rich History and Technology.\"" 
    cutscene "\"The place is a fortress. It is swarming with all sorts of attack droids, Cyebertrons, Hackerborgs, and god-only-knows-what.\""
    cutscene "\"You will need to arm yourself to the teeth in order to get there.\""
    cutscene "\"I will be in touch soon. Thank you, Lieutenant-Sargeant #{player.name}.\""
    cutscene "*click*"
    cutscene "The phone goes silent..."
end

def chapter_two(player,prompt)
    puts "\n\nChapter 2 - In my quarters".light_green
    puts ("-"*35).light_green
    tmpgets

    cutscene "It is a bright, sunny day."
    cutscene "The clock is just about to strike 9:00."
    cutscene "The milktoast is soggy, but filling."
    cutscene "*Knock, knock*"
    cutscene "*Knock, knock*"
    choices = {"Yes?" => 1, "[Open the door]" => 2}
    request = prompt.select("Say:", choices, show_help: :never)
    if request == 1  
        cutscene "You say, \"Yes, who is it?\""
        cutscene "\"It is Private Kenneth, sir\"."
        cutscene "\"Come on in then, Private.\""
        cutscene "The door opens."
    elsif request == 2
        cutscene "You open the door."
        cutscene "It is Private Kenneth."  
    end
    cutscene "\"Sir, the preparations are ready,\" he says."
    cutscene "\"We are simply waiting for you, sir.\""
    cutscene "\"At ease, Private,\" you tell him."
    cutscene "\"Have the wreaths been arranged exactly as we had agreed?\" you ask."
    cutscene "\"Yes, sir,\" says Private Kenneth. \"And the ...\""
    cutscene "\"...the...\""
    cutscene "\"...bodies...\""
    cutscene "\"...have also been prepared the way we wanted them.\""
    cutscene "You hear a sniff."
    cutscene "\"Sir. *sniff*. I just don't believe it.\""
    cutscene "\"...Rita...\""
    cutscene "\"She...she... was so young. So... so... young...\""
    cutscene "\"She deserved much better than this...\" you say."
    cutscene "\"I...I... knew her when she used to build pillow forts...\""
    cutscene "\"...and pretend to defend herself against...\""
    cutscene "\"This is a terrible loss for us,\" you say."
    cutscene "\"...and Kevin, sir... and Paula...and...and...\""
    cutscene "\"We are all devastated by this loss,\" you comfort him."
    cutscene "\"...and...Stefano as well... \""
    cutscene "You notice a tear roll down Private Kenneth's eye."
    cutscene "\"These were all good people who shouldn't have lost their lives,\" you say."
    cutscene "\"The Robots have much to answer for!!!\" snarls Private Kenneth angrily."
    cutscene "\"If I die the same death, I want to take down at least a hundred of those tin-monkeys before I go out!\""
    cutscene "\"Easy there, Private,\" you say. \"It is not worth to simply throw your life away out of anger.\""
    cutscene "\"But...they...killed...Rita...sir...\""
    cutscene "\"Yes, I know, Private,\" you say. \"But one living soldier is worth fifty dead robots.\""
    cutscene "\"Y...yes, sir,\""
    cutscene "\"Come on, now,\" you say. \"I'd rather not be late for the funeral.\""
    cutscene "You both walk down towards the opening in the woods."
    cutscene "Six caskets lay side by side."
    cutscene "The shimmering sun is shining upon the caskets through openings in the tree branches."
    cutscene "A crowd of about 20 are gathered around the caskets, looking silent and mournful."
    cutscene "A man dressed in white is standing holding a book."
    cutscene "\"We're ready to get started,\" he says."
    cutscene "\"I'll let you lead the ceremony, Father,\" you say."
    cutscene "Father opens the book and starts reading."
    cutscene "\"We're gathered here today to mourn the passing of six of the bravest souls...\""
    cutscene "\"... Who were taken from us... Far too early and far too young...\""
    cutscene "\"Rita, Kevin, Paula, Stefano, Holsworth, Harvey were the bravest heroes we knew.\""
    cutscene "\"Last night, during an attack on our external compound by the ungodly beings, these souls gave up their lives...\""
    cutscene "\"...to protect the rest of us...\""
    cutscene "Father looks up towards the sky."
    cutscene "\"Please come forth if you have a few words to say.\""
    choices = {"[Say a few words]" => 1, "[Don't say a few words]" => 2}
    request = prompt.select("", choices, show_help: :never) 
    if request == 1
        cutscene "\"Our youngest brothers and sisters were taken from us last night,\" you say."
        cutscene "\"They died while defending our external compound from the greatest threat known to mankind\""
        cutscene "\"...\""
        cutscene "There is a shiver amongst the crowd."
        cutscene "\"The machines,\" you continue..."
        cutscene "\"They do not fear us.\""
        cutscene "\"And they never take pity on us.\""
        cutscene "\"We must honour our brethren...\""
        cutscene "\"... by... \""
    choices = {"...fighting back..." => 1, "...never giving up on each other..." => 2}  
    request = prompt.select("", choices, show_help: :never)
        cutscene (request == 1) ? "\n\"...being ever more vigilant than ever before\"" : "\n\"...supporting each other through the toughest of times... more than we have ever before\""
        cutscene "\"Each of us has to be willing to die for humanity.\""
        cutscene "\"Anything less, and they've already won...\""
        cutscene "\"You know the cost now... and you know what we're facing...\""
        cutscene "\"Be ready.\""
        cutscene "\"Be brave.\""
        cutscene "\"Be vigilant.\""
        cutscene "\"Thank you.\""
    end
    cutscene "Father picks up from there."
    cutscene "\"By the spirits, I bid you farewell,\" says the Father."
    cutscene "\"May you depart this life and find peace in the afterlife.\""
    cutscene "\"And look upon us and guide us through the utmost of difficulties.\""
    cutscene "\"Amen\""
    cutscene "\"Amen,\" the crowd murmurs, and breaks apart."
    # request = prompt.select("", choices, show_help: :never)  

end

def chapter_three(player,prompt)
    puts "\n\nChapter 3 - In the armory".light_green
    puts ("-"*35).light_green

end