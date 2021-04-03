require "./classes"
require "./characters"
require "./methods"
require 'colorized_string'

room = Room.new

room_door_horizontal = "| DOOR |"
room_door_vertical = "---\n D \n O \n O \n R \n---"
room.place([2,35],room_door_horizontal,:green)
room.place([8,83],room_door_vertical,:blue)
room.place([8,1],room_door_vertical,:red)
room.place([23,35],room_door_horizontal,:yellow)
room.place([15,53],player_char,:blue)
room.draw

puts room_door_horizontal.colorize(:blue)