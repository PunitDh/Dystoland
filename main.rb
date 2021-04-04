# Goals
# Track the player's health
# 1) Check if player is alive
# 2) Let the player leave the room
# 3) 

#[:black, :light_black, :red, :light_red, :green, :light_green, :yellow, :light_yellow, :blue, :light_blue, :magenta, :light_magenta, :cyan, :light_cyan, :white, :light_white, :default]

require "./classes"
require "./methods"
require "./chapters"
require "./data"
require 'colorize'
require 'tty-prompt'

title = "\n\n\n\n\n\t\t\t╔" + "═"*69+"╗
\t\t\t║                                                                     ║
\t\t\t║         Welcome to...                                               ║
\t\t\t║                                                                     ║
\t\t\t║         █▀▀▄ █  █ █▀▀ ▀▀█▀▀ █▀▀█ █   █▀▀█ █▀▀▄ █▀▀▄                 ║
\t\t\t║         █  █ █▄▄█ ▀▀█   █   █  █ █   █▄▄█ █  █ █  █                 ║
\t\t\t║         █▄▄▀ ▄▄▄█ ▀▀▀   ▀   ▀▀▀▀ ▀▀▀ ▀  ▀ ▀  ▀ ▀▀▀                  ║
\t\t\t║                                                                     ║
\t\t\t║           ...A PERILOUS ADVENTURE THROUGH A DYSTOPIAN WASTELAND     ║
\t\t\t║                                                                     ║"+"
\t\t\t║                                               "+"PRESS ENTER TO START".blink+"  ║"+"
\t\t\t║                                                                     ║
\t\t\t║                    Created by PunitDh (2021)                        ║
\t\t\t║                                                                     ║
\t\t\t╚" + "═"*69 + "╝\n"

title_city =
"\t\t\t        
\t\t\t          ▄███████▄▄                 ▄███████▄▄ 
\t\t\t        ▀██▀▌ ▄██▄ ▀█▄            ▄██▀▄██▄ ▀▀▀█▀
\t\t\t          █▐  ████  ▐▀█          ██▌  ████▌ ▌█▀ 
\t\t\t          ▐█▌  ▀▀   ▀ ▀█        ▄█ ▐▄  ▀▀  ▄█▀  
\t\t\t            ▀▀▌▄▄▐▀                  ▐▐▄▄▓▀▀    ".red+"
\t\t\t                       ┌┴┐
\t\t\t                       │┼│
\t\t\t                      ┌┘┼│            ._____       
\t\t\t              ┌───┐   ├┼ ┤            ╔╦╦╦╦╗' ╔╦╦╦╦╗   ╔╦╦╦╦╗
\t\t\t      ╔╗    ┌─┘┼┼┼└─┐┌┼┼┼┤     .__┌┐  ╠╬╬╬╬╣  ╠┼┼┼┼╣   ╠╬╬╬╬╣
\t\t\t    ╔╦╠╣  _.│┼┼│┼┼┼┼ ├┼┼┼└┬┬┬┐ ├┼┼┼┤  ╠╬╬╬╬╣╔╦╬╬╬╬╬╣   ╠╬╬╬╬╣
\t\t\t    ╠╬╬╣ |.┼┼┼┼│┼┼┼┼│├┼┼┼┼┼┼┼┤ ├┼┼┼┤  ╠╬╬╬╬╣╠╬╬╬╬╬╬╣   ╠╬╬╬╬╣
\t\t\t ___╠╬╬╣─┘┼┼┼┼┼│   ┼│ ┼┼┼┼┼┼┼┤_├┼┼█┤__╠╬╬╬╬╣╠┼┼█┼┼╬╣___╠╬╬╬╬╣
\t\t\t~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n".blue

player = Player.new
prompt = TTY::Prompt.new(symbols: {marker: ">"})
puts title.red
puts title_city
tmpgets
puts "\n"*30

begin
  # chapter_setting(player,prompt)
  # chapter_one(player,prompt)
  # chapter_two(player,prompt)
  chapter_three(player,prompt)
  exit
end while (player.health > 0)