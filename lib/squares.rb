# frozen_string_literal: true

# This class will handle the logic for the level on the screen
class Squares
  attr_reader :level

  # @squares Will hold the squares that will be shown on the screen
  def initialize
    @level = 0
    @squares = []
    add_level
  end

  # Every time the player gets to a new level this method will add the necessary squares to matrix
  def add_level
    # Adds one to the current level
    @level += 1
    # It pushes down the existing lines down before adding a new one
    push_lines_down
    # It adds a new line of square accordign to the level
    add_line(@level)
  end

  def check_collision(screen_position)
    @squares.each do |lines|
      lines.map { |square| square.check_collision(screen_position) }
      lines.reject! { |square| square.count <= 0 }
    end
    puts @squares
    puts
  end

  private

  # It adds a line into the grid according to the level
  def add_line(level)
    # Sets how many squares will be add to the line
    num_squares = rand(2..SQUARES_PER_LINE)
    # Set the position of those squares in the line
    positions = calculate_level_positions(num_squares)
    # Calculates the count for the squares
    counts = calculate_counts_positions(positions, level)
    # Add the squares to the @squares matrix
    @squares.append(add_squares(positions, counts))
  end

  def calculate_level_positions(num_squares)
    positions = []
    while positions.count < num_squares
      try = rand(SQUARES_PER_LINE)
      positions.append(try) unless positions.include?(try)
    end
    positions
  end

  # Set up the count for the squares
  # 70% of the time the count will be equal to the level
  # 26% of the time the count will twice the value fo the level
  #  4% of the time the count will be three times the value of the level
  def calculate_counts_positions(positions, level)
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
    counts
  end

  def add_squares(positions, counts)
    add = []
    positions.each_index do |index|
      add.append(MySquare.new(
                   grid_position: Vector2d.new(positions[index], 1),
                   count: counts[index]
                 ))
    end
    add
  end

  # It pushes the existing lines of squares one line down
  def push_lines_down
    @squares.each do |line|
      line.map(&:move_down)
    end
  end
end
