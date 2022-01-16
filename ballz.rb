# frozen_string_literal: true

# Ballz
# Lino Oropeza
# Dec 2021
# This is my version of the game ballz for iPhone

# Required Libraries
require 'ruby2d'
require 'vector2d'

# Require local dependecies
require_relative 'lib/my_square'
##  Main Program  ##

# Constants
SQUARE_SIZE = 64 # Size of the squares of the game
SQUARE_DIVISION = 3 # Separation between squares
FONT_SIZE = SQUARE_SIZE.to_f / 2.5 # Size of the font of the counter in the square

# Setting up the window
set({
      title: 'Ballz',
      background: 'black',
      width: SQUARE_SIZE * 7,
      height: SQUARE_SIZE * 9,
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

my_square = MySquare.new({
                           position: Vector2d.new(3, 3),
                           z: 1,
                           size: SQUARE_SIZE,
                           color: 'red',
                           count: 5
                         })

# Show the window
show
