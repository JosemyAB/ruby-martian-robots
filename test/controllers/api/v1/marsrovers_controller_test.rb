require 'test_helper'
require 'uri'

class Api::V1::MarsroversControllerTest < ActionDispatch::IntegrationTest

  service_url = "/api/v1/marsrovers?inputdata="

  test "should get index" do
    input_data = "5 5\n1 2 N\nMM"
    get URI::encode(service_url + input_data)
    assert_response :success
    assert_equal({'final_positions' => ['1 4 N']}, response.parsed_body)
  end

  test "one rover move to north and turn left" do
    input_data = "5 5\n1 2 N\nML"
    get URI::encode(service_url + input_data)
    assert_response :success
    assert_equal({'final_positions' => ['1 3 W']}, response.parsed_body)
  end

  test "two rovers moves to north and shouth and turn left and right" do
    input_data = "5 5\n1 2 N\nML\n2 4 S\nMR"
    get URI::encode(service_url + input_data)
    assert_response :success
    p response.parsed_body
    assert_equal({'final_positions' => ['1 3 W', '2 3 W']}, response.parsed_body)
  end

end
