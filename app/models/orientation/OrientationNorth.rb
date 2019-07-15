
class OrientationNorth < Orientation

  def turn_right
    OrientationEast.new
  end

  def turn_left
    OrientationWest.new
  end

  def next_x_position
    0
  end

  def next_y_position
    1
  end

  def show_orientation
    "N"
  end

end
