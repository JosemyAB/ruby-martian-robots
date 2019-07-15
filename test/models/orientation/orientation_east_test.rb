require 'test_helper'
require './app/models/landscape/planet'
require_all './app/models/orientation'

class OrientationEastTest < ActiveSupport::TestCase
  test "turn left" do
    orientation = OrientationEast.new
    assert_equal true, orientation.turn_left.instance_of?(OrientationNorth)
  end
end
