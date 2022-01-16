# frozen_string_literal: true

# Ballz
# Lino Oropeza
# Dec 2021
# This is my version of the game ballz for iPhone

# Required Libraries
require 'ruby2d'
require 'vector2d'

# Require local dependecies

##  Main Program  ##

# Constants
SQUARE_SIZE = 64

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

# Show the window
show
