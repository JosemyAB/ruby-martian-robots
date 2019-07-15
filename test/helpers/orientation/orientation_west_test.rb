require 'test_helper'
require './app/models/landscape/planet'
require_all './app/helpers/orientation'

class OrientationWestTest < ActiveSupport::TestCase
  test "turn left" do
    orientation = OrientationWest.new
    assert_equal true, orientation.turn_left.instance_of?(OrientationSouth)
  end
end
