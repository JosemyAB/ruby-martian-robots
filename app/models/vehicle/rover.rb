require_all './app/models/orientation'
require_all './app/models/landscape'

class Rover
  def initialize(planet, position, orientation)
    @planet = planet
    @position = position
    @orientation = orientation
  end

  def location
    "#{@position.location} #{@orientation.show_orientation}"
  end

  def move
    next_x_pos = @position.x_axis + @orientation.next_x_position
    next_y_pos = @position.y_axis + @orientation.next_y_position
    new_position = Position.new(next_x_pos, next_y_pos)

    if @planet.is_valid_position(new_position)
      @position = new_position
    else
      "Position #{new_position.location} #{@orientation.show_orientation} is outside plateau limits"
    end
  end

  def turn_left
    @orientation = @orientation.turn_left
    end

  def turn_right
    @orientation = @orientation.turn_right
  end
end
