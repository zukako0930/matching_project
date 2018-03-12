require 'test_helper'

class MeetRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meet_request = meet_requests(:one)
  end

  test "should get index" do
    get meet_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_meet_request_url
    assert_response :success
  end

  test "should create meet_request" do
    assert_difference('MeetRequest.count') do
      post meet_requests_url, params: { meet_request: { request_user_id: @meet_request.request_user_id, target_user_id: @meet_request.target_user_id } }
    end

    assert_redirected_to meet_request_url(MeetRequest.last)
  end

  test "should show meet_request" do
    get meet_request_url(@meet_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_meet_request_url(@meet_request)
    assert_response :success
  end

  test "should update meet_request" do
    patch meet_request_url(@meet_request), params: { meet_request: { request_user_id: @meet_request.request_user_id, target_user_id: @meet_request.target_user_id } }
    assert_redirected_to meet_request_url(@meet_request)
  end

  test "should destroy meet_request" do
    assert_difference('MeetRequest.count', -1) do
      delete meet_request_url(@meet_request)
    end

    assert_redirected_to meet_requests_url
  end
end
