
class OrientationWest < Orientation

  def turn_right
    OrientationNorth.new
  end

  def turn_left
    OrientationSouth.new
  end

  def next_x_position
    -1
  end

  def next_y_position
    0
  end

  def show_orientation
    "W"
  end
end
