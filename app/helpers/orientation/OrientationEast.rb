
class OrientationEast < Orientation

  def turn_right
    OrientationSouth.new
  end

  def turn_left
    OrientationNorth.new
  end

  def next_x_position
    1
  end

  def next_y_position
    0
  end

  def show_orientation
    "E"
  end

end
