require 'test_helper'

class BigquakesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bigquake = bigquakes(:one)
  end

  test "should get index" do
    get bigquakes_url
    assert_response :success
  end

  test "should get new" do
    get new_bigquake_url
    assert_response :success
  end

  test "should create bigquake" do
    assert_difference('Bigquake.count') do
      post bigquakes_url, params: { bigquake: { latitude: @bigquake.latitude, locationSource: @bigquake.locationSource, longitude: @bigquake.longitude, magError: @bigquake.magError } }
    end

    assert_redirected_to bigquake_url(Bigquake.last)
  end

  test "should show bigquake" do
    get bigquake_url(@bigquake)
    assert_response :success
  end

  test "should get edit" do
    get edit_bigquake_url(@bigquake)
    assert_response :success
  end

  test "should update bigquake" do
    patch bigquake_url(@bigquake), params: { bigquake: { latitude: @bigquake.latitude, locationSource: @bigquake.locationSource, longitude: @bigquake.longitude, magError: @bigquake.magError } }
    assert_redirected_to bigquake_url(@bigquake)
  end

  test "should destroy bigquake" do
    assert_difference('Bigquake.count', -1) do
      delete bigquake_url(@bigquake)
    end

    assert_redirected_to bigquakes_url
  end
end
