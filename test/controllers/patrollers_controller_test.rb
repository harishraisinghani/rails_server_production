require 'test_helper'

class PatrollersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patroller = patrollers(:one)
  end

  test "should get index" do
    get patrollers_url
    assert_response :success
  end

  test "should get new" do
    get new_patroller_url
    assert_response :success
  end

  test "should create patroller" do
    assert_difference('Patroller.count') do
      post patrollers_url, params: { patroller: { destination_id: @patroller.destination_id, firstname: @patroller.firstname, lastname: @patroller.lastname, on_shift: @patroller.on_shift, password: 'secret', password_confirmation: 'secret', username: @patroller.username } }
    end

    assert_redirected_to patroller_url(Patroller.last)
  end

  test "should show patroller" do
    get patroller_url(@patroller)
    assert_response :success
  end

  test "should get edit" do
    get edit_patroller_url(@patroller)
    assert_response :success
  end

  test "should update patroller" do
    patch patroller_url(@patroller), params: { patroller: { destination_id: @patroller.destination_id, firstname: @patroller.firstname, lastname: @patroller.lastname, on_shift: @patroller.on_shift, password: 'secret', password_confirmation: 'secret', username: @patroller.username } }
    assert_redirected_to patroller_url(@patroller)
  end

  test "should destroy patroller" do
    assert_difference('Patroller.count', -1) do
      delete patroller_url(@patroller)
    end

    assert_redirected_to patrollers_url
  end
end
