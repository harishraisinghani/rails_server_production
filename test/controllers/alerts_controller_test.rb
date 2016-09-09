require 'test_helper'

class AlertsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alert = alerts(:one)
  end

  test "should get index" do
    get alerts_url
    assert_response :success
  end

  test "should get new" do
    get new_alert_url
    assert_response :success
  end

  test "should create alert" do
    assert_difference('Alert.count') do
      post alerts_url, params: { alert: { dispatcher_id: @alert.dispatcher_id, false_alarm: @alert.false_alarm, patroller_id: @alert.patroller_id, ping_id: @alert.ping_id, state: @alert.state, user_generated: @alert.user_generated } }
    end

    assert_redirected_to alert_url(Alert.last)
  end

  test "should show alert" do
    get alert_url(@alert)
    assert_response :success
  end

  test "should get edit" do
    get edit_alert_url(@alert)
    assert_response :success
  end

  test "should update alert" do
    patch alert_url(@alert), params: { alert: { dispatcher_id: @alert.dispatcher_id, false_alarm: @alert.false_alarm, patroller_id: @alert.patroller_id, ping_id: @alert.ping_id, state: @alert.state, user_generated: @alert.user_generated } }
    assert_redirected_to alert_url(@alert)
  end

  test "should destroy alert" do
    assert_difference('Alert.count', -1) do
      delete alert_url(@alert)
    end

    assert_redirected_to alerts_url
  end
end
