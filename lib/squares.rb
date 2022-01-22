# frozen_string_literal: true

# This class will handle the logic for the level on the screen
class Squares
  attr_reader :level

  # @squares Will hold the squares that will be shown on the screen
  def initialize
    @level = 1
    @squares = []
    add_level(@level)
  end

  # Every time the player gets to a new level this method will add the necessary squares to matrix
  def add_level(_level)
    # Sets how many squares will be add to the line
    count = rand(2..SQUARES_PER_LINE)

    # Set the position of those squares in the line
    position = []
    while position.count < count
      try = rand(SQUARES_PER_LINE)
      position.append(try) unless position.include?(try)
    end
    puts count
    pp position
  end
end
