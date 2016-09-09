require 'test_helper'

class PingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ping = pings(:one)
  end

  test "should get index" do
    get pings_url
    assert_response :success
  end

  test "should get new" do
    get new_ping_url
    assert_response :success
  end

  test "should create ping" do
    assert_difference('Ping.count') do
      post pings_url, params: { ping: { checkin_id: @ping.checkin_id, lat: @ping.lat, long: @ping.long } }
    end

    assert_redirected_to ping_url(Ping.last)
  end

  test "should show ping" do
    get ping_url(@ping)
    assert_response :success
  end

  test "should get edit" do
    get edit_ping_url(@ping)
    assert_response :success
  end

  test "should update ping" do
    patch ping_url(@ping), params: { ping: { checkin_id: @ping.checkin_id, lat: @ping.lat, long: @ping.long } }
    assert_redirected_to ping_url(@ping)
  end

  test "should destroy ping" do
    assert_difference('Ping.count', -1) do
      delete ping_url(@ping)
    end

    assert_redirected_to pings_url
  end
end
