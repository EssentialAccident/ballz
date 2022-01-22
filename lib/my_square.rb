# frozen_string_literal: true

# This class will manage the logic for the squares
class MySquare < Ruby2D::Square
  # @screen_position is a Vector2d object that contains the position of the square on the screen
  # @grid_position is a Vecotor2d object that contains the position of the square in the grid
  # The grid is defined by SQUARES_PER_LINE and SQUARES_PER_COLUMN

  def initialize(opts = {})
    # opts[:position] is the position of the square on the grid
    # Initializing the square
    super
    # For some reason, in the initializer, Ruby does not use the custom setter.
    # It has to be called appending the self. in front of it.
    self.grid_position = opts[:grid_position]
    self.color = 'red'
    self.size = SQUARE_SIZE
    self.z = 1

    @count = opts[:count]

    # Initializing the text
    @count_text = Text.new(
      @count.to_s,
      {
        size: FONT_SIZE,
        color: 'white',
        z: @z + 3
      }
    )
    calculate_text_position
  end

  # @grid_position setter
  def grid_position=(position)
    @grid_position = position
    @x = (@grid_position.x * SQUARE_SIZE) + ((@grid_position.x + 1) * SQUARE_DIVISION)
    @y = (@grid_position.y * SQUARE_SIZE) + ((@grid_position.y + 1) * SQUARE_DIVISION)
  end

  def move_down
    @grid_position += Vecotor2d.new(0, 1)
  end

  private

  def calculate_text_position
    x = @x + (SQUARE_SIZE / 2) - (FONT_SIZE * @count.to_s.length / 2)
    y = ((@y + SQUARE_SIZE) / 2) - (FONT_SIZE / 2)
    @count_text.x = x
    @count_text.y = y
  end
end
