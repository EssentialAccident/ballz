# frozen_string_literal: true

# Ballz
# Lino Oropeza
# Dec 2021
# This is my version of the game ballz for iPhone

# Required Libraries
require 'ruby2d'
require 'vector2d'
require 'pp'

# Require local dependecies
require_relative 'lib/my_square'
require_relative 'lib/squares'
##  Main Program  ##

# Constants
SQUARE_SIZE = 64 # Size of the squares of the game
SQUARE_DIVISION = 5 # Separation between squares
FONT_SIZE = SQUARE_SIZE.to_f / 2.5 # Size of the font of the counter in the square
SQUARES_PER_LINE = 7
SQUARES_PER_COLUMN = 9

# Setting up objects
squares = Squares.new

# Setting up the window
set({
      title: 'Ballz',
      background: 'black',
      width: (SQUARE_SIZE * SQUARES_PER_LINE) + (SQUARE_DIVISION * (SQUARES_PER_LINE + 1)),
      height: (SQUARE_SIZE * SQUARES_PER_COLUMN) + (SQUARE_DIVISION * (SQUARES_PER_COLUMN + 1)),
      resizable: false,
      fullscreen: false
    })

# Events
on :key_down do |event|
  case event.key
  when 'escape'
    close
  end
end

# Update loop
update do
end

# Show the window
show
