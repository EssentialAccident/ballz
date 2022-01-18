# frozen_string_literal: true

# This class will manage the logic for the squares
class MySquare < Ruby2D::Square
  def initialize(opts = {})
    # Initializing the square
    @position = opts[:position] + Vector2d.new(SQUARE_DIVISION, SQUARE_DIVISION)
    @count = opts[:count]
    opts[:x] = @position.x
    opts[:y] = @position.y
    opts[:size] -= SQUARE_DIVISION
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

  private

  def calculate_text_position
    x = @x + (SQUARE_SIZE / 2) - (FONT_SIZE * @count.to_s.length / 2)
    y = ((@y + SQUARE_SIZE) / 2) - (FONT_SIZE / 2)
    @count_text.x = x
    @count_text.y = y
  end
end
