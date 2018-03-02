require 'test_helper'

class MatchRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @match_request = match_requests(:one)
  end

  test "should get index" do
    get match_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_match_request_url
    assert_response :success
  end

  test "should create match_request" do
    assert_difference('MatchRequest.count') do
      post match_requests_url, params: { match_request: { integer: @match_request.integer, integer: @match_request.integer, request_user_id: @match_request.request_user_id, target_user_id: @match_request.target_user_id } }
    end

    assert_redirected_to match_request_url(MatchRequest.last)
  end

  test "should show match_request" do
    get match_request_url(@match_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_match_request_url(@match_request)
    assert_response :success
  end

  test "should update match_request" do
    patch match_request_url(@match_request), params: { match_request: { integer: @match_request.integer, integer: @match_request.integer, request_user_id: @match_request.request_user_id, target_user_id: @match_request.target_user_id } }
    assert_redirected_to match_request_url(@match_request)
  end

  test "should destroy match_request" do
    assert_difference('MatchRequest.count', -1) do
      delete match_request_url(@match_request)
    end

    assert_redirected_to match_requests_url
  end
end
