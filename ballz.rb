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
SQUARES_PER_LINE = 7
SQUARES_PER_COLUMN = 9

# Setting up the window
set({
      title: 'Ballz',
      background: 'black',
      width: SQUARE_SIZE * SQUARES_PER_LINE,
      height: SQUARE_SIZE * SQUARES_PER_COLUMN,
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
squares = []
(Window.width / SQUARE_SIZE).times do |count|
  squares.append(
    MySquare.new({
                   position: Vector2d.new(count * SQUARE_SIZE, 0),
                   z: 1,
                   size: SQUARE_SIZE,
                   color: 'red',
                   count: 5
                 })
  )
end
# Show the window
show
