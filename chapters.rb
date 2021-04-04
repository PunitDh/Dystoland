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
      quote("*Cough cough*. Please, sir. You must help me."),
      "It sounds like it is the voice of a dying old man."
    ]
  
    request = promptchoices(prompt, "Say:", {"Who is this?" => 1, "How did you get this number?" => 2})
    
    cutscene "\"*Cough cough*,\" says the old man. \"My name is Wallace, sir. I got your number through your old co-worker Samuel.\""
  
    request = promptchoices(prompt, "Say:", {"What can I do for you?" => 1, "How can I help?" => 2})
  
    cutscenes ["\n\"Please, sir. You must help me. Samuel spoke highly of you and I know of your reputation.\"", "\"You must help me. *cough cough*\"", "\"Please check your phone. I'm about to send you a photograph.\"", "[BLEEP] You have received a message."]
  
    request = promptchoices(prompt, "", "[Open the message]" => 1)
    cutscene "It's a photograph."
    Image.print("Cyb")
 
    request = promptchoices(prompt, "You say...\n", {"What is this?" => 1, "Who is this?" => 2})
  
    cutscenes ["\"This is Cyb,\" says Wallace. \"Cyb is a robot.\"",
      "\"I built Cyb myself.\"",
      "\"*Cough cough*\"",
      "\"*Cough cough*\"",
      "\"I wish to have Cyb's memory erased.\"",
      "\"I see,\" you say."]

    request = promptchoices(prompt, "", {"[Ask him why]" => 1, "[Don't ask him why]" => 2})
    cutscene "\"Why do you wish to have his memory erased?\" you ask him." if request == 1
  
    cutscenes ["\"Cyb has been in my family for almost two decades,\" he says. \"*Cough cough*\"", "\"I built Cyb with my own hands to protect me and my family.\"", "\"But he knows too much. I fear that after my death, he will fall into the wrong hands.\""]
  
    request = promptchoices(prompt, "", {"[Say nothing]" => 1, "[Ask him why he can't you do this himself]" => 2})
  
    cutscene "\"Why can't you do this yourself?\" you ask him." if request == 2
    
    cutscene "\"Lieutenant-Sargeant #{player.name}, I know of your reputation. You disabled the Arch-Gamma Megaframe two years ago.\""
  
    choices = {"You know about that?" => 1, "Yes, that, I did." => 2}
    request = promptchoices(prompt, "Say:", choices)
  
    cutscene "\"You know about that, do you, Wallace?\" you ask him." if request == 1
  
    cutscene "\"Your old colleague Samuel mentioned it.\"" if request == 1
  
    cutscene "\"Yes, that was quite a mission we undertook,\" you say" if request == 2
  
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
          choices = {"You're right. Sorry, I don't." => 1, "70,000 or no deal." => 2}
          request = prompt.select("Say:", choices, show_help: :never)
          cutscene "You're right, sorry, Wallace. The needs of humanity far outweigh anything else. Let's settle at 50,000" if request == 1
          if request == 2
            cutscene "70,000 or no deal, Wallace."
            cutscene "Fine, you can have 70,000 credits. I'll give you the rest of the money after the task is done. \""
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
      "\"Cyb is a modified version of the Cybertron-8X110, the same robot that the Cybernetics use for law enforcement operations\"",
      "\"Which means, even if you delete his memory, he will still have backup copies in the Cloud.\"",
      "\"You will need a special device called the " + "K-311 Gamma Siphoner".light_green + ".\"",
      "\"This is the only device capable of disabling the robot and deleting all memories from the Cloud.\"",
      "\"I'm going to have a drone deliver the " + "K-311 Gamma Siphoner".light_green + " to you in the next 2 hours.\""]

    begin
      choices = {"Great. Thank you, Wallace." => 1, "[Tell him you don't need it]" => 2}
      request = prompt.select("What do you do?\n".light_green, choices, show_help: :never)
      cutscene "\n\"Don't be a fool,\" says Wallace. \"You wouldn't last 2 days without the device.\"" if request == 2
    end while request == 2
    cutscenes [
      "\"Great. Now we're on track.\"",
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
    elsif request == 2
        cutscenes ["You open the door.", "It is Private Kenneth."]  
    end
    cutscenes [
      "\"Sir, the preparations are ready,\" he says.",
      "\"We are simply waiting for you, sir.\"",
      "\"At ease, Private,\" you tell him.",
      "\"Have the wreaths been arranged exactly as we had agreed?\" you ask.",
      "\"Yes, sir,\" says Private Kenneth. \"And the ...\"",
      "\"...the...\"",
      "\"...bodies...\"",
      "\"...have also been prepared the way we wanted them.\"",
      "You hear a sniff.",
      "\"Sir. *sniff*. I just don't believe it.\"",
      "\"...Rita...\"",
      "\"She...she... was so young. So... so... young...\"",
      "\"She deserved much better than this...\" you say.",
      "\"I...I... knew her when she used to build pillow forts...\"",
      "\"...and pretend to defend herself against...\"",
      "\"This is a terrible loss for us,\" you say.",
      "\"...and Kevin, sir... and Paula...and...and...\"",
      "\"We are all devastated by this loss,\" you comfort him.",
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
      "You both walk down towards the opening in the woods.",
      "Six caskets lay side by side.",
      "The shimmering sun is shining upon the caskets through openings in the tree branches.",
      "A crowd of about 20 are gathered around the caskets, looking silent and mournful",
      "A man dressed in white is standing holding a book.",
      "\"We're ready to get started,\" he says.",
      "\"I'll let you lead the ceremony, Father,\" you say.",
      "It begins.",
      "Father opens the book and starts reading.",
      "\"We're gathered here today to mourn the passing of six of the bravest people we've known\"",
      "\"Rita, Kevin, Paula, Stefano, Holsworth, Harvey were the bravest heroes we knew.\"",
      "\"Last night, during an attack on our external compound by the ungodly machines, they were taken from us.\"",
      "\"Far too early. Far too young.\"",
      "Father looks up towards the sky.",
      "\"Please come forth if you have a few words to say.\""]
    request = promptchoices(prompt, "", {"[Say a few words]" => 1, "[Don't say a few words]" => 2}) 
    if request == 1
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
    puts "-----------------------".light_green
    cutscene "\"\""

    begin
      puts "You have: " + (player.credits.to_s + " credits").yellow
      request = promptchoices(prompt, "", {"Buy Guns" => 1, "Buy armor" => 2, "Buy healthpacks" => 3, "Buy ammo" => 4, "[Exit Armory]" => 5})
      case request
        when 1
          # do this
        when 2
          # do this
        when 3
          # do this
        when 4
          # do this
        when 5
          request = promptchoices(prompt, "Are you sure you want to exit the Armory?", {"Yes" => 6, "No" => 7})
      end
    end until request == 6

    enemyencounter(player, prompt, "dumpsterbot")
    enemyencounter(player, prompt, "trashborg",30)
end