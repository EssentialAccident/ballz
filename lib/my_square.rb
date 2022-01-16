# frozen_string_literal: true

# This class will manage the logic for the squares
class MySquare < Ruby2D::Square
  def initialize(opts = {})
    @position = opts[:position]
    opts[:x] = @position.x
    opts[:y] = @position.y
    super(opts)
    @count = opts[:count]
  end
end
