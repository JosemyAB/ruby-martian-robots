
class OrientationSouth < Orientation

  def turn_right
    OrientationWest.new
  end

  def turn_left
    OrientationEast.new
  end

  def next_x_position
    0
  end

  def next_y_position
    -1
  end

  def show_orientation
    "S"
  end
end
