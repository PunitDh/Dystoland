# Dystoland

A text-based adventure game set in a dystopian future where humanity fights back against robot overlords.

## How to Play

Run the game with:
```bash
ruby dystoland.rb
```

Choose New Game, Load Game, or Exit from the main menu. Navigate through the story by making choices at each prompt. Fight robots, manage your inventory, and complete missions to save humanity.

## Features

- Interactive story with multiple choice decisions
- Turn-based combat system
- ASCII art graphics
- Inventory management (healthpacks, grenades, credits) - view current quantities in armory, use healthpacks to heal
- Upgradeable weapons and armor using decoded data
- Cipher system for decoding enemy data into upgrade tokens
- **Save/Load system** - Save progress at the start of each chapter, automatically load on death
- Multiple chapters with increasing difficulty

## Game Structure

The game consists of 5 chapters:
1. **Setting** - Introduction and character creation
2. **The Phone Call** - Receiving the mission from Wallace
3. **In the Quarters** - Funeral and preparation
4. **In the Armory** - Retrieving the Gamma Siphoner
5. **Confronting Cyb** - Final confrontation and ending

## Requirements

- Ruby
- Gems: colorize, tty-prompt

Install dependencies:
```bash
bundle install
```

## Story

In the year 2155, robots have conquered humanity. You are a lieutenant in the Resistance, tasked with a critical mission to erase the memory of a powerful robot named Cyb to prevent a greater catastrophe.
