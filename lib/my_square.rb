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
    self.z = 1
    self.color = 'red'
    self.size = SQUARE_SIZE
    # The X and Y coordinates of the text depend on everything else
    # The text needs to be already instanciated when the position setter is called
    initialize_text_count
    self.grid_position = opts[:grid_position]
    self.count = opts[:count]

    # Initializing the text
  end

  # @grid_position setter
  def grid_position=(position)
    # Updating the grid position
    @grid_position = position
    # Updating the screen position of the square accordign to grid position
    self.x = (@grid_position.x * SQUARE_SIZE) + ((@grid_position.x + 1) * SQUARE_DIVISION)
    self.y = (@grid_position.y * SQUARE_SIZE) + ((@grid_position.y + 1) * SQUARE_DIVISION)
    # Updating the posiotion of the text aacording to grid position

    @count_text.x = @x + @count_text.size
    @count_text.y = @y + (@count_text.size / 2)
  end

  def count=(count)
    @count = count
    @count_text.text = @count.to_s
  end

  def move_down
    new_position = @grid_position + Vector2d.new(0, 1)
    self.grid_position = new_position
  end

  private

  def initialize_text_count
    @count_text = Text.new(
      '',
      {
        size: FONT_SIZE,
        color: 'white',
        z: @z + 3
      }
    )
  end
end
