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

player = Player.new
prompt = TTY::Prompt.new(symbols: {marker: ">"})

tmpgets
puts "\n"*30

begin
  # chapter_setting(player,prompt)
  # chapter_one(player,prompt)
  # chapter_two(player,prompt)
  chapter_three(player,prompt)
  exit
end while (player.health > 0)