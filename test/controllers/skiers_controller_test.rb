require 'test_helper'

class SkiersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @skier = skiers(:one)
  end

  test "should get index" do
    get skiers_url
    assert_response :success
  end

  test "should get new" do
    get new_skier_url
    assert_response :success
  end

  test "should create skier" do
    assert_difference('Skier.count') do
      post skiers_url, params: { skier: { current_checkin_id: @skier.current_checkin_id, ec1: @skier.ec1, ec1phone: @skier.ec1phone, ec2: @skier.ec2, ec2phone: @skier.ec2phone, email: @skier.email, firstname: @skier.firstname, lastname: @skier.lastname, password: 'secret', password_confirmation: 'secret', phone: @skier.phone, profile_picture: @skier.profile_picture, username: @skier.username } }
    end

    assert_redirected_to skier_url(Skier.last)
  end

  test "should show skier" do
    get skier_url(@skier)
    assert_response :success
  end

  test "should get edit" do
    get edit_skier_url(@skier)
    assert_response :success
  end

  test "should update skier" do
    patch skier_url(@skier), params: { skier: { current_checkin_id: @skier.current_checkin_id, ec1: @skier.ec1, ec1phone: @skier.ec1phone, ec2: @skier.ec2, ec2phone: @skier.ec2phone, email: @skier.email, firstname: @skier.firstname, lastname: @skier.lastname, password: 'secret', password_confirmation: 'secret', phone: @skier.phone, profile_picture: @skier.profile_picture, username: @skier.username } }
    assert_redirected_to skier_url(@skier)
  end

  test "should destroy skier" do
    assert_difference('Skier.count', -1) do
      delete skier_url(@skier)
    end

    assert_redirected_to skiers_url
  end
end
