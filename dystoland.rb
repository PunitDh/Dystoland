#!/usr/bin/env ruby

# Goals
# Track the player's health
# 1) Check if player is alive
# 2) Let the player leave the room
# 3) 

#[:black, :light_black, :red, :light_red, :green, :light_green, :yellow, :light_yellow, :blue, :light_blue, :magenta, :light_magenta, :cyan, :light_cyan, :white, :light_white, :default]

require "./classes"
require_relative "./views/display-title.rb"
require "./methods"
require "./chapters"
require "./data"
require 'colorize'
require 'tty-prompt'

displaytitle()

prompt = TTY::Prompt.new(symbols: {marker: ">"})

tmpgets
puts "\n"*30

# Main menu loop
player = nil
current_chapter = 0
loop do
  choice = prompt.select("Welcome to Dystoland!", {"New Game" => 1, "Load Game" => 2, "Exit" => 3})

  case choice
  when 1
    player = Player.new
    current_chapter = 0
    break
  when 2
    loaded = load_game
    if loaded
      player, current_chapter = loaded
      break
    else
      cutscene "No save file found."
      # Stay in menu
    end
  when 3
    exit
  end
end

if player.nil?
  puts "Error: Player not initialized"
  exit
end

begin
  if current_chapter <= 0
    chapter_setting(player,prompt)
    save_game(player, 1)
    current_chapter = 1
  end
  if current_chapter <= 1
    chapter_one(player,prompt)
    if player.health <= 0
      loaded = load_game
      player, current_chapter = loaded if loaded
      next
    end
    save_game(player, 2)
    current_chapter = 2
  end
  if current_chapter <= 2
    chapter_two(player,prompt)
    if player.health <= 0
      loaded = load_game
      player, current_chapter = loaded if loaded
      next
    end
    save_game(player, 3)
    current_chapter = 3
  end
  if current_chapter <= 3
    chapter_three(player,prompt)
    if player.health <= 0
      loaded = load_game
      player, current_chapter = loaded if loaded
      next
    end
    save_game(player, 4)
    current_chapter = 4
  end
  if current_chapter <= 4
    chapter_four(player,prompt)
    if player.health <= 0
      loaded = load_game
      player, current_chapter = loaded if loaded
      next
    end
    save_game(player, 5)
    current_chapter = 5
  end
  if current_chapter <= 5
    chapter_five(player,prompt)
    exit
  end
end while true