# frozen_string_literal: true

# This class will handle the logic for the balls
class Balls
  # This class handles the logic for one ball
  def initialize(num_balls = 1)
    @num_balls = num_balls
    @balls = []
    @num_balls.times do
      @balls.append(
        Circle.new(
          x: (Window.width / 2) - BALL_RADIUS,
          y: (Window.height - BALL_RADIUS) - SQUARE_DIVISION,
          radius: BALL_RADIUS,
          color: 'green'
        )
      )
    end
  end
end
