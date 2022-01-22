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
  def add_level(level)
    # Sets how many squares will be add to the line
    num_squares = rand(2..SQUARES_PER_LINE)

    # Set the position of those squares in the line
    positions = []
    while positions.count < num_squares
      try = rand(SQUARES_PER_LINE)
      positions.append(try) unless positions.include?(try)
    end

    # Set up the count for the squares
    # 70% of the time the count will be equal to the level
    # 26% of the time the count will twice the value fo the level
    #  4% of the time the count will be three times the value of the level
    counts = []
    positions.count.times do
      case rand(100)
      when 0..70
        try = level
      when 71..95
        try = level * 2
      when 96..100
        try = level * 3
      end
      counts.append(try)
    end

    # Add the squares to the @squares matrix
    add = []
    positions.each_index do |index|
      add.append(MySquare.new(
                   grid_position: Vector2d.new(positions[index], 1),
                   count: counts[index]
                 ))
    end
    puts num_squares
    puts level
    pp positions.sort
    pp counts
  end
end
