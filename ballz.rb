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
require_relative 'lib/ball'
##  Main Program  ##

# Constants
SQUARE_SIZE = 64 # Size of the squares of the game
SQUARE_DIVISION = 5 # Separation between squares
FONT_SIZE = SQUARE_SIZE.to_f / 3 # Size of the font of the counter in the square
SQUARES_PER_LINE = 7
SQUARES_PER_COLUMN = 9
BALL_RADIUS = SQUARE_SIZE / 8

# Setting up the window
set({
      title: 'Ballz',
      background: 'black',
      width: (SQUARE_SIZE * SQUARES_PER_LINE) + (SQUARE_DIVISION * (SQUARES_PER_LINE + 1)),
      height: (SQUARE_SIZE * SQUARES_PER_COLUMN) + (SQUARE_DIVISION * (SQUARES_PER_COLUMN + 1)),
      resizable: false,
      fullscreen: false
    })

# Setting up objects
squares = Squares.new
balls = Balls.new

# Events
on :key_down do |event|
  case event.key
  when 'escape'
    close
  when 'a'
    squares.add_level
  end
end

on :mouse_down do |event|
  case event.button
  when :left
    squares.check_collision(Vector2d.new(event.x, event.y))
  end
end

# Update loop
update do
end

# Show the window
show
