# frozen_string_literal: true

# This class will manage the logic for the squares
class MySquare < Ruby2D::Square
  # @screen_position is a Vector2d object that contains the position of the square on the screen
  # @grid_position is a Vecotor2d object that contains the position of the square in the grid
  # The grid is defined by SQUARES_PER_LINE and SQUARES_PER_COLUMN

  def initialize(opts = {})
    # opts[:position] is the position of the square on the grid
    # Initializing the square
    grid_position(opts[:grid_position])
    @count = opts[:count]
    opts[:x] = @screen_position.x
    opts[:y] = @screen_position.y
    opts[:color] = 'red'
    opts[:size] = SQUARE_SIZE
    super(opts)

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

  def grid_position(position)
    @grid_position = position
    @screen_position = Vector2d.new(
      (position.x * SQUARE_SIZE) + ((position.x + 1) * SQUARE_DIVISION),
      (position.y * SQUARE_SIZE) + ((position.y + 1) * SQUARE_DIVISION)
    )
  end

  private

  def calculate_text_position
    x = @x + (SQUARE_SIZE / 2) - (FONT_SIZE * @count.to_s.length / 2)
    y = ((@y + SQUARE_SIZE) / 2) - (FONT_SIZE / 2)
    @count_text.x = x
    @count_text.y = y
  end
end
