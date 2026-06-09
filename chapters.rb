def chapter_setting(player,prompt)
    puts "Setting".light_green
    puts "-----------------------".light_green
    # Image.print("robotsconqueringearth")
    cutscene "The year is 2155. Humanity has been taken over by robots."
  
    cutscene "You are a member of the Resistance movement named the Retakers."
    
    cutscene "You have been fighting tirelessly for over 20 years to retake the planet back from the grasp of the robots."
  
    begin
      puts "What is your name?".light_green
      print "Name: "
      player.name = gets.chomp
      print "Your designation is: Lieutenant-Sargeant #{player.name}.\n\n"
      request = promptchoices(prompt, "Are you okay with this?\n", {"Yes" => 1, "No" => 2})
    end while request == 2

    Image.print("leiutenant")
    cutscene("Welcome, Lieutenant-Sargeant #{player.name}")
end

def chapter_one(player,prompt)
    puts "\n\nChapter 1 - The phone call".light_green
    puts "-----------------------".light_green
  
    cutscenes [
      "Your base is located deep within the Brasshall Forest, where no robot has set foot in.",
      "\nOne day, you get a phone call."
    ]
  
    Image.print("cellphone")
  
    cutscenes [
      "*Ring Ring*",
      "*Ring Ring*",
      "\nYou answer the phone.",
      "\"*Cough cough*. Please, sir. You must help me.\"",
      "It sounds like it is the voice of a dying old man."
    ]
  
    request = promptchoices(prompt, "Say:", {"Who is this?" => 1, "How did you get this number?" => 2})
    
    cutscene "\n\"*Cough cough*,\" says the old man. \"My name is Wallace, sir. I got your number through your old co-worker Samuel.\""
  
    request = promptchoices(prompt, "Say:", {"What can I do for you?" => 1, "How can I help?" => 2})
  
    cutscenes ["\n\"Please, sir. You must help me. Samuel spoke highly of you and I know of your reputation.\"", "\"You must help me. *cough cough*\"", "\"Please check your phone. I'm about to send you a photograph.\"", "[BLEEP]".yellow+" You have received a message."]
  
    request = promptchoices(prompt, "", "[Open the message]" => 1)
    cutscene "It's a photograph."
    Image.print("Cyb")
 
    request = promptchoices(prompt, "You say...\n", {"What is this?" => 1, "Who is this?" => 2})
  
    cutscenes ["\n\"This is Cyb,\" says Wallace. \"Cyb is a robot.\"",
      "\"I built Cyb myself.\"",
      "\"*Cough cough*\"",
      "\"*Cough cough*\"",
      "\"I wish to have Cyb's memory erased.\"",
      "\"I see,\" you say."]

    request = promptchoices(prompt, "", {"[Ask him why]" => 1, "[Don't ask him why]" => 2})
    cutscene "\"Why do you wish to have his memory erased?\" you ask him." if request == 1
  
    cutscenes ["\"Cyb has been in my family for almost two decades,\" he says. \"*Cough cough*\"", "\"I built Cyb with my own hands to protect me and my family.\"", "\"But he knows too much. I fear that after my death, he will fall into the wrong hands.\""]
  
    request = promptchoices(prompt, "", {"[Say nothing]" => 1, "[Ask him why he can't you do this himself]" => 2})
  
    cutscene "\n\"Why can't you do this yourself?\" you ask him." if request == 2
    
    cutscene "\"Lieutenant-Sargeant #{player.name}, I know of your reputation. You disabled the Arch-Gamma Megaframe two years ago.\""
  
    choices = {"You know about that?" => 1, "Yes, that, I did." => 2}
    request = promptchoices(prompt, "Say:", choices)
  
    cutscene "\n\"You know about that, do you, Wallace?\" you ask him." if request == 1
  
    cutscene "\"Your old colleague Samuel mentioned it.\"" if request == 1
  
    cutscene "\n\"Yes, that was quite a mission we undertook,\" you say" if request == 2
  
    cutscenes [
      "\"*Cough cough*\"",
      "\"Disabling the Arch-Gamma Megaframe was a major victory for humanity. You stopped an invasion from happening, and countless human lives were saved that day.\"",
      "\"There is nobody more in this world more suited for this task than you are. *Cough cough*\"",
      "\"That's why I want you, and nobody else, to do this for me.\"",
      "\"Please do a complete memory wipe on Cyb.\""]

    request = promptchoices(prompt, "Say:", {"I see." => 1, "Okay." => 2})
  
    cutscenes ["\n\n\"I will obviously make it worth your while,\" says Wallace.",
    "\"For your troubles, I will give you 25,000 credits.\"",
    "\"Will you do it?\""]
  
    request = promptchoices(prompt, "Say:", {"Well, that's quite an offer, Wallace. Yes, I'll take it." => 1, "Actually, I want 50,000." => 2})
    
    if request == 1
      player.wallace_credits = 25000
      player.credits += 25000
    end
  
    if request == 2
      cutscene "\n\"Actually, Wallace. I can do it for no less than 50,000,\" you say."
      cutscene "\"*Cough cough* my dear boy,\" says Wallace. \"You drive a hard bargain. Do you really want to gamble with a dying old man's life?\""
      choices = {"You're right, I'm sorry, Wallace. Let's keep it at 25,000" => 1, "50,000 is my price. Take it or leave it." => 2}
      request = prompt.select("Say:", choices, show_help: :never)
      if request == 2
        cutscene "\n\"This is a task that may put my life and other's lives at risk. 50,000 is my price,\" you say."
        cutscene "\"Well, that's quite an ask,\" says Wallace. \"Fine. Let's do 50,000.\""
        cutscene "\"I will pay you 25,000 now and the rest when the task is done.\""
        cutscene "You have gained: "+"+25000 credits".yellow
        player.credits += 25000
        player.wallace_credits = 50000
        choices = {"Thank you, Wallace. I won't let you down." => 1, "Actually, that was too easy, old man. Now I want 70,000." => 2}
        request = prompt.select("Say:", choices, show_help: :never)
        if request == 2
          cutscene "\n\"I knew you were a hard man, Mr #{player.name}. But I didn't know you were also pompous and self-indulgent. Do you seriously want to bargain with me up to 70,000?"
          choices = {"You're right. Sorry, I don't." => 1, "70,000 or no deal." => 2}
          request = prompt.select("Say:", choices, show_help: :never)
          cutscene "You're right, sorry, Wallace. The needs of humanity far outweigh anything else. Let's settle at 50,000" if request == 1
          if request == 2
            cutscene "\n\"70,000 or no deal, Wallace.\""
            cutscene "\"Fine, you can have 70,000 credits. I'll give you the rest of the money after the task is done. \""
            player.wallace_credits = 70000
            cutscene "You have lost: " + "-2 karma points.".light_red
            player.karma -= 2
          end
        end
      end
    end
    cutscenes [
      "\"Well, now you know how important this is to me,\" Wallace says.",
      "\"Cyb is not like other robots.\"",
      "\"Cyb is smarter and stronger than most robots on the planet.\"",
      "\"I built Cyb to protect myself and my family.\"",
      "\"Ever since the Robot Revolution, it has become increasingly necessary to have robots on your side.\"",
      "\"Unfortunately, this is not a simple a task where you hack into his subsystem and press the Delete button.\"",
      "\"Cyb is a modified version of the Cybertron-8X110, the same robot that they use for law enforcement operations\"",
      "\"Which means, even if you delete his memory, he will still have backup copies in the Cloud.\"",
      "\"You will need a special device called the " + "K-311 Gamma Siphoner".light_green + ".\"",
      "\"This is the only device capable of disabling the robot and deleting all memories from the Cloud.\"",
      "\"Your first task will be to retrieve the " + "K-311 Gamma Siphoner".light_green + " from the Atlas Station.\"",
    "\"Be careful. The place is heavily guarded!!!\""]

    begin
      choices = {"Great. Thank you, Wallace." => 1, "[Tell him you don't need it]" => 2}
      request = prompt.select("What do you do?\n".light_green, choices, show_help: :never)
      cutscene "\n\"Don't be a fool,\" says Wallace. \"You wouldn't last 2 days without the device.\"" if request == 2
    end while request == 2
    cutscenes [
      "\n\"Great. Now we're on track.\"",
      "\"Cyb is located deep within the hearts of the Lambda Sector.\"",  
      "\"He has built himself a home in the Museum of Rich History and Technology.\"",
      "\"The place is a fortress. It is swarming with all sorts of attack droids, Cyebertrons, Hackerborgs, and god-only-knows-what.\"",
      "\"You will need to arm yourself to the teeth in order to get there.\""]
    cutscene "\"I will be in touch soon. Thank you, Lieutenant-Sargeant #{player.name}.\""
    cutscenes ["*click*", "The phone goes silent..."]
end

def chapter_two(player,prompt)
    puts "\n\nChapter 2 - In my quarters".light_green
    puts "-----------------------".light_green
    tmpgets

    cutscenes [
      "It is a bright, sunny day.",
      "The clock is just about to strike 9:00.",
      "The milktoast is soggy, but filling.",
      "*Knock, knock*",
      "*Knock, knock*"]
    request = promptchoices(prompt, "Say:", {"Yes?" => 1, "[Open the door]" => 2})
    if request == 1  
        cutscenes [
          "You say, \"Yes, who is it?\"",
          "\"It is Private Kenneth, sir\".",
          "\"Come on in then, Private.\"",
          "The door opens."]
          Image.print("dooropen")
    elsif request == 2
        cutscene "\nYou open the door."
        Image.print("dooropen")
        cutscene "It is Private Kenneth."  
    end
    
    # 
    cutscenes [
      "\"Sir, the preparations are ready,\" he says.",
      "\"We are simply waiting for you, sir.\"",
      "\"At ease, Private,\" you tell him.",
      "\"Have the wreaths been arranged exactly as we had agreed?\" you ask.",
      "\"Yes, sir,\" says Private Kenneth. \"And the ...\"",
      "\"...the...\"",
      "\"...bodies...\"",
      "\"...have also been prepared the way we wanted them.\"",
      "You hear a sniff."]
      Image.print("privatekenneth")
    cutscenes [
      "\"Sir. *sniff*. I just don't believe it.\"",
      "\"...Rita...\"",
      "\"She...she... was so young. So... so... young...\""]
      Image.print("leiutenant")
      cutscene "\"She deserved much better than this...\" you say."
      Image.print("privatekenneth")
      cutscenes [
      "\"I...I... knew her when she used to build pillow forts...\"",
      "\"...and pretend to defend herself against...\""]
      Image.print("leiutenant")
      cutscene "\"This is a terrible loss for us,\" you say."
      cutscene "\"...and Kevin, sir... and Paula...and...and...\""
      cutscenes ["\"We are all devastated by this loss,\" you comfort him.",
      "\"...and...Stefano as well... \"",
      "You notice a tear roll down Private Kenneth's eye.",
      "\"These were all good people who shouldn't have lost their lives,\" you say.",
      "\"The robots have much to answer for!!!\" snarls Private Kenneth angrily.",
      "\"If I die the same death, I want to take down at least a hundred of those tin-monkeys before I go out!\"",
      "\"Easy there, Private,\" you say. \"It is not worth to simply throw your life away out of anger.\"",
      "\"But...they...killed...Rita...sir...\"",
      "\"Yes, I know, Private,\" you say. \"But one living soldier is worth fifty dead robots to me.\"",
      "\"Y...yes, sir,\" says Private Kenneth.",
      "\"Come on, now,\" you say. \"I'd rather not be late for the funeral.\"",
      "You both walk down towards the opening in the woods",
      "Six caskets lay side by side."]
      Image.print("caskets")
      cutscenes [
      "The shimmering sun is shining upon the caskets through openings in the tree branches.",
      "A crowd of about 20 are gathered around the caskets, looking silent and mournful",
      "A man dressed in white is standing holding a book.",
      "\"We're ready to get started,\" he says.",
      "\"I'll let you lead the ceremony, Father,\" you say.",
      "It begins.",
      "Father opens the book and starts reading."]
      Image.print("book")
      cutscenes [
      "\"We're gathered here today to mourn the passing of six of the bravest people we've known\"",
      "\"Rita, Kevin, Paula, Stefano, Holsworth, Harvey were the bravest heroes we knew.\"",
      "\"Last night, during an attack on our external compound by the ungodly machines, they were taken from us.\"",
      "\"Far too early. Far too young.\"",
      "Father looks up towards the sky.",
      "\"Please come forth if you have a few words to say.\""]
    request = promptchoices(prompt, "", {"[Say a few words]" => 1, "[Don't say a few words]" => 2}) 
    if request == 1
        Image.print("leiutenant")
        cutscenes [
          "\"Our youngest brothers and sisters were taken from us last night,\" you say.",
          "\"They died while defending our external compound from the greatest threat known to mankind thus far.\"",
          "\"...\"",
          "There is a shiver amongst the crowd.",
          "\"The machines,\" you continue...",
          "\"They do not fear us.\"",
          "\"And they will never take pity on us.\"",
          "\"We must honour our brethren...\"",
          "\"... by... \""]
    request = promptchoices(prompt, "", {"...fighting back..." => 1, "...never giving up on each other..." => 2})
        cutscene (request == 1) ? "\n\"...being ever more vigilant than ever before\"" : "\n\"...supporting each other through the toughest of times... more than we have ever before\""
        cutscenes [
          "\"Each of us has to be willing to die for humanity.\"",
          "\"Anything less, and they've already won...\"",
          "\"You know the cost now... and you know what we're facing...\"",
          "\"Be ready.\"",
          "\"Be brave.\"",
          "\"Be vigilant.\"",
          "\"Thank you.\""]
    end
    Image.print("book")
    cutscenes [
      "Father picks up from there.",
      "\"By the spirits, I bid you farewell,\" says the Father.",
      "\"May you depart this life and find peace in the afterlife.\"",
      "\"And look upon us and guide us through the utmost of difficulties.\"",
      "\"Amen\"",
      "\"Amen,\" the crowd murmurs, and breaks apart."]
    # request = prompt.select("", choices, show_help: :never)  

end

def chapter_three(player,prompt)
    puts "\n\nChapter 3 - In the armory".light_green
    puts "------------------------------".light_green

    cutscenes [
      "\"Getting to Cyb is no easy task. First you must retrieve "  + "K-311 Gamma Siphoner".light_green + " from Atlas Station.\"",
      "\"Atlas Station is located 20km north of here, so the helicopter will drop you there.\"",
      "\"From then on, it will be on foot.\"",
      "\"Be careful... The place is swarming with all kinds of scummy robots...\"",
      "\"Before you go into battle against the robots, make sure you purchase a gun that can actually do some damage.\""]
    player.credits = 25000
    showarmory(player,prompt,true)

    cutscene "\"Alright, time to make a move.\""
    cutscene "\"The helicopter will fly you over to the first zone, sir.\""
    cutscene "[Few hours later...]"
    Image.print("leiutenant")
    cutscenes [
      "\"Alright, we're here...\"",
      "\"Time to go in quick, grab what we need, and get out...\"",
      "\"...\"",
      "\"...\"",
      "\"But... uh oh...\"",
      "\"What the hell is that ugly thing???\""]

    enemyencounter(player, prompt, "dumpsterbot",40,false)

    Image.print("lieutenant")
    cutscenes ["\"...\"", "\"God, what an ugly thing...\"", "\"Here comes another...\""]

    enemyencounter(player, prompt, "trashborg",50,false)

    cutscenes ["\"...\"", "\"God, these things keep coming...\"", "\"Better reload...\""]

    enemyencounter(player, prompt, "trashborg",60,false,"You may have beaten the last two, but you won't beat me!")

    cutscenes ["\"...\"", "\"Not going to catch a break today...\"", "\"Better reload...\""]

    enemyencounter(player, prompt, "screwdroid",70,false,"ERROR!!! ERROR!!! THIS DEVICE CANNOT CONTROL HIMSELF!!!")

    cutscenes ["\"...\"", "\"Okay, hopefully that's all done and over with...\"", "\"Uh oh...\""]

    enemyencounter(player, prompt, "trashborg",100,false,"NOT ON MY WATCH!!!!!!!!")

    showarmory(player,prompt)

    cutscenes [
      "\"Alright, that should be enough...\"",
      "\"Now, let's find that Gamma Siphoner...\"",
      "\"It should be in the main control room...\"",
      "\"Let's move...\""]

    # More encounters or puzzles here
    cutscenes [
      "\"Here we are... the control room...\"",
      "\"The Gamma Siphoner is right there...\"",
      "\"But it's guarded...\""]

    enemyencounter(player, prompt, "guardbot",80,true,"Intruder alert! You shall not pass!")

    cutscenes [
      "\"Got it! The " + "K-311 Gamma Siphoner".light_green + "...\"",
      "\"Now, back to base...\"",
      "\"Mission accomplished... for now...\""]
end

def chapter_four(player,prompt)
  puts "\n\nChapter 4 - Preparing for Cyb".light_green
  puts "------------------------------".light_green

  cutscenes [
    "Back at base...",
    "\"Well done, Lieutenant. You have the Gamma Siphoner.\"",
    "\"Now, the real challenge begins...\"",
    "\"Cyb is in the Lambda Sector, in the Museum of Rich History and Technology.\"",
    "\"It's heavily fortified.\"",
    "\"You'll need to infiltrate, find Cyb, and use the Siphoner to erase his memory.\"",
    "\"But first, let's upgrade your gear...\""]

  showarmory(player,prompt)

  cutscenes [
    "\"Alright, time to head out.\"",
    "\"The helicopter will take you to the outskirts of the Lambda Sector.\"",
    "\"From there, it's on foot.\"",
    "\"Good luck, Lieutenant. Humanity depends on you.\""]

  # Travel to Lambda Sector
  cutscenes [
    "[Later...]",
    "\"This is the Lambda Sector...\"",
    "\"Looks abandoned, but I know better...\"",
    "\"Robots could be anywhere...\""]

  enemyencounter(player, prompt, "scoutdroid",30,true,"Halt! Identify yourself!")

  cutscenes [
    "\"One down...\"",
    "\"The museum should be ahead...\""]

  # More encounters
  enemyencounter(player, prompt, "securitybot",60,true,"Security breach detected!")

  cutscenes [
    "\"Getting closer...\"",
    "\"There it is... the Museum...\""]
end

def chapter_five(player,prompt)
  puts "\n\nChapter 5 - At The Museum Gates".light_green
  puts "--------------------------------".light_green

  cutscenes [
    "\"That's the Museum of Rich History and Technology...\"",
    "\"Too quiet... I don't like it.\"",
    "\"If Cyb is in there, he's expecting trouble.\"",
    "\"Best not to rush this.\""]

  cutscenes [
    "You duck into the shell of a ruined security booth near the museum perimeter.",
    "For the first time since entering the Lambda Sector, you have a moment to breathe.",
    "Your radio crackles to life."]

  cutscenes [
    "\"Lieutenant, come in,\" says a voice over the comms.",
    "\"We've been trying to raise you for ten minutes.\"",
    "\"This is Wallace,\" comes the familiar voice after a cough.",
    "\"You've done well to make it this far.\""]

  request = promptchoices(prompt, "Say:", {"I'm at the museum gates." => 1, "You picked a wonderful time to call." => 2})
  cutscene "\"I'm at the museum gates. Still alive, somehow,\" you say." if request == 1
  cutscene "\"You picked a wonderful time to call, Wallace,\" you mutter." if request == 2

  cutscenes [
    "\"Listen carefully,\" says Wallace.",
    "\"Cyb will not behave like the machines you've fought so far.\"",
    "\"He learns. He adapts. And if he recognizes the Gamma Siphoner, he will try to destroy it first.\"",
    "\"Do not let him control the pace of the battle.\""]

  cutscenes [
    "\"We've also located an old Retaker dead-drop near your position,\" says the voice on the radio.",
    "\"There should still be usable supplies inside.\"",
    "\"Take what you need before you enter the museum.\""]

  cutscene "Hidden beneath a loose floor panel, you find an emergency field cache."
  player.credits += 3000
  player.healthpacks += 1
  player.grenades += 1
  cutscene "You recover +3000 credits, +1 healthpack, and +1 grenade from the cache."

  cutscenes [
    "\"This is it,\" you whisper to yourself.",
    "\"Once I walk through those doors, there is no turning back.\"",
    "\"I'd better make every last credit count.\""]

  showarmory(player,prompt)

  cutscenes [
    "\"Weapons checked.\"",
    "\"Siphoner secured.\"",
    "\"Time to finish what I came here to do.\"",
    "You step out from the ruined booth and make for the museum entrance.",
    "Its old security lights flicker to life one by one as you approach..."]
end

def chapter_six(player,prompt)
  puts "\n\nChapter 6 - Confronting Cyb".light_green
  puts "----------------------------".light_green

  cutscenes [
    "Inside the Museum...",
    "\"This place is a maze...\"",
    "\"Exhibits from before the revolution...\"",
    "\"But no time for sightseeing...\"",
    "\"Cyb should be in the main hall...\""]

  # More enemies
  enemyencounter(player, prompt, "museumguard",70,true,"You dare enter this sacred place?")

  cutscenes [
    "\"Almost there...\"",
    "\"I can hear something...\""]

  Image.print("Cyb")
  cutscenes [
    "\"There he is... Cyb...\"",
    "\"Cyb: 'Intruder detected. Prepare for termination.'\"",
    "\"Time to use the Gamma Siphoner...\""]

  # Boss fight with Cyb
  enemyencounter(player, prompt, "Cyb",150,true,"You cannot erase me. I am eternal.")

  cutscenes [
    "\"He's down...\"",
    "\"Now, plug in the Siphoner...\""]

  # Puzzle or choice for memory wipe
  request = promptchoices(prompt, "Choose the memory to erase:", {"Combat data" => 1, "Personal memories" => 2, "All memories" => 3})

  case request
  when 1
    cutscene "\"Erasing combat data...\""
  when 2
    cutscene "\"Erasing personal memories...\""
  when 3
    cutscene "\"Erasing all memories...\""
  end

  cutscenes [
    "\"Done...\"",
    "\"Cyb is now harmless...\"",
    "\"Mission complete...\"",
    "\"Time to report back...\""]

  if player.karma > 0
    cutscenes [
      "Back at base...",
      "\"Excellent work, Lieutenant.\"",
      "\"Cyb's memory is erased.\"",
      "\"Your honorable actions have inspired hope in humanity.\"",
      "\"The Resistance grows stronger.\""]
  elsif player.karma < 0
    cutscenes [
      "Back at base...",
      "\"The mission is complete, Lieutenant.\"",
      "\"Cyb's memory is erased.\"",
      "\"But your greed has not gone unnoticed.\"",
      "\"The Resistance watches its own.\""]
  else
    cutscenes [
      "Back at base...",
      "\"Well done, Lieutenant.\"",
      "\"Cyb's memory is erased.\"",
      "\"The fight against the robots continues.\"",
      "\"For now, humanity has a chance.\""]
  end

  cutscenes [
    "A few hours later, Cyb is wheeled into one of the base workshops.",
    "He is silent now. Power drained. Head lowered.",
    "Wallace stands beside the workbench with both hands pressed against the metal, saying nothing."]

  cutscenes [
    "\"You got what you wanted,\" you say quietly.",
    "\"He's wiped.\"",
    "Wallace nods, but does not look relieved.",
    "\"Yes,\" he says. \"I know.\""]

  cutscenes [
    "One of the mechanics frowns at a small panel near Cyb's chest.",
    "\"Sir... this wasn't in the schematics,\" she says.",
    "\"There's a compartment in here.\"",
    "The room goes still."]

  cutscenes [
    "Inside the compartment is something wrapped in cloth.",
    "Not a weapon. Not a drive core. Not a key.",
    "Just an old photograph, worn soft at the edges from being handled too many times.",
    "Wallace goes pale the moment he sees it."]

  cutscenes [
    "\"No...\" he whispers.",
    "You look from the photograph to Cyb, and then back to Wallace.",
    "\"Who is she?\" you ask.",
    "Wallace closes his eyes."]

  puts "\n" + "TO BE CONTINUED...".center(50).light_red
  tmpgets
end

def chapter_seven(player,prompt)
  puts "\n\nChapter 7 - What Wallace Didn't Say".light_green
  puts "------------------------------------".light_green

  cutscenes [
    "That night, Wallace asks to speak with you alone.",
    "He does not take you to the command hall.",
    "He takes you to a small storage room at the edge of the infirmary, where nobody ever goes unless they have to.",
    "The photograph is already waiting on the table."]

  cutscenes [
    "\"I should have told you the truth from the beginning,\" Wallace says.",
    "\"Or enough of it, at least.\"",
    "\"But once I started lying, it became easier to keep lying.\"",
    "He looks older than he did on the phone."]

  request = promptchoices(prompt, "Say:", {"You used me." => 1, "Start talking, Wallace." => 2})
  cutscene "\"You used me,\" you say." if request == 1
  if request == 2
    cutscene "\"Start talking, Wallace,\" you say."
  end

  cutscenes [
    "\"Perhaps I did,\" he says. \"And I am sorry for that.\"",
    "\"Cyb was never just a machine I built to guard my house.\"",
    "\"He became something else to us.\"",
    "\"Something I was not ready to name out loud.\""]

  cutscenes [
    "He slides the photograph toward you.",
    "On the back is an address, written in fading ink.",
    "\"That was my home,\" Wallace says.",
    "\"There may still be something there. Something Cyb was trying to protect from me... or for me. I no longer know which.\""]

  player.credits += 5000
  cutscene "Wallace quietly transfers +5000 credits to cover the trip."

  cutscenes [
    "\"If you're asking me to clean up another secret of yours, say it plainly,\" you tell him.",
    "\"I'm asking you to help me face one,\" Wallace replies.",
    "\"Go to the house. See what's left. Then decide what kind of man you think I am.\""]

  showarmory(player,prompt)

  cutscenes [
    "At first light, you leave the base alone.",
    "The address leads you far from the front lines, into a dead suburb swallowed by weeds and ash.",
    "Here the war feels older.",
    "Quieter too."]

  cutscenes [
    "The street signs are rusted almost white.",
    "Some of the houses are burned out.",
    "Others look untouched until you get close enough to see there is nothing living behind the windows.",
    "\"So this is where Wallace came from...\" you murmur."]

  cutscenes [
    "Wallace's house sits at the end of a narrow lane beneath a dead jacaranda tree.",
    "The front gate hangs open.",
    "The upstairs light is on.",
    "That is impossible, and you know it."]

  enemyencounter(player, prompt, "scoutdroid",45,true,"Property boundary crossed.")

  cutscenes [
    "\"A guard detail... all this time?\"",
    "\"Wallace really didn't tell me much.\""]

  enemyencounter(player, prompt, "securitybot",75,true,"Residential archive sealed.")

  cutscenes [
    "Inside, the house smells of dust, old wood, and rain that leaked in years ago.",
    "Family pictures still line the hallway.",
    "Most of the glass is cracked.",
    "None of the frames have been taken."]

  cutscenes [
    "In an upstairs bedroom, you find a locked cedar chest pushed beneath a bed.",
    "The key is still taped behind a dresser drawer, exactly where someone must have left it on purpose.",
    "Inside the chest are letters, a child's drawings, and maintenance notes in Wallace's hand.",
    "At the very bottom lies a small data module wrapped in the same cloth as the photograph."]

  cutscenes [
    "You do not open it there.",
    "Instead, you slip it into your coat and look once more at the room.",
    "Someone lived here. Laughed here. Waited here.",
    "The war came after that."]

  player.credits += 4000
  player.garbagedata << "wallace-house-module"
  cutscene "You have gained +4000 credits and recovered a sealed data module."

  cutscenes [
    "When you call Wallace from the front porch, he answers on the first ring.",
    "You tell him what you found.",
    "He is silent for so long that you check whether the line has gone dead.",
    "\"Bring it back,\" he says at last."]
end

def chapter_eight(player,prompt)
  puts "\n\nChapter 8 - The House On Bell Street".light_green
  puts "------------------------------------".light_green

  cutscenes [
    "Back at base, Wallace asks you not to bring the module to command.",
    "He meets you instead in the same workshop where Cyb was laid out on the table.",
    "The room is dim. Everyone else has been sent away.",
    "\"If this contains what I think it does,\" Wallace says, \"then after tonight you may decide never to speak to me again.\""]

  cutscenes [
    "You slot the module into an old reader.",
    "At first the screen shows only static and file corruption.",
    "Then the image clears just enough.",
    "Wallace sits down hard in the nearest chair."]

  showarmory(player,prompt)

  cutscenes [
    "You watch the recording in silence.",
    "When it ends, neither of you speaks for a long while.",
    "Outside, somewhere beyond the workshop walls, the base carries on as though nothing has changed.",
    "Inside, the world has shifted a little."]

  cutscenes [
    "\"So that's why you wanted him wiped,\" you say at last.",
    "Wallace does not deny it.",
    "\"Partly,\" he says.",
    "\"And partly because I was afraid of what he might remember that I could not bear to.\""]

  request = promptchoices(prompt, "Say:", {"You should have trusted me." => 1, "You should have trusted Cyb." => 2})
  cutscene "\"You should have trusted me enough to tell me,\" you say." if request == 1
  if request == 2
    cutscene "\"You should have trusted Cyb,\" you say."
    player.karma += 1
    cutscene "You have gained: +1 karma.".light_green
  end

  cutscenes [
    "Before Wallace can answer, a sound comes from the workbench behind you.",
    "A soft mechanical click.",
    "Then another.",
    "Cyb's fingers move."]

  cutscenes [
    "The two of you turn at the same time.",
    "Cyb is still strapped to the table, but one dark lens has lit again.",
    "Not bright. Not hostile. Just awake.",
    "\"Lieutenant,\" Wallace says, barely above a whisper. \"Do not leave.\""]

  puts "\n\nEND OF CURRENT CHAPTERS".center(50)
  puts "The story will continue from here.".center(50)
  puts "Final Karma: #{player.karma}".center(50)
  exit
end
