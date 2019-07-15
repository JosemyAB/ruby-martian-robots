require_relative './position'


class Planet

  def initialize(x_axis_dimension, y_axis_dimension)
    @x_axis_dimension = x_axis_dimension
    @y_axis_dimension = y_axis_dimension
  end

  attr_reader :x_axis_dimension, :y_axis_dimension

  def is_valid_position(position)
    is_x_position_inside_plateau(position.x_axis) && is_y_position_inside_plateau(position.y_axis)
  end

  private

  def is_y_position_inside_plateau(y_position)
    y_position >= 0 && y_position <= self.y_axis_dimension
  end

  def is_x_position_inside_plateau(x_position)
    x_position >= 0 && x_position <= self.x_axis_dimension
  end

end
