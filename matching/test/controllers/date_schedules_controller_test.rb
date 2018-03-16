require 'test_helper'

class DateSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @date_schedule = date_schedules(:one)
  end

  test "should get index" do
    get date_schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_date_schedule_url
    assert_response :success
  end

  test "should create date_schedule" do
    assert_difference('DateSchedule.count') do
      post date_schedules_url, params: { date_schedule: { confirm: @date_schedule.confirm, date_of_meet: @date_schedule.date_of_meet, date_sug_user_id: @date_schedule.date_sug_user_id, date_tar_user_id: @date_schedule.date_tar_user_id } }
    end

    assert_redirected_to date_schedule_url(DateSchedule.last)
  end

  test "should show date_schedule" do
    get date_schedule_url(@date_schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_date_schedule_url(@date_schedule)
    assert_response :success
  end

  test "should update date_schedule" do
    patch date_schedule_url(@date_schedule), params: { date_schedule: { confirm: @date_schedule.confirm, date_of_meet: @date_schedule.date_of_meet, date_sug_user_id: @date_schedule.date_sug_user_id, date_tar_user_id: @date_schedule.date_tar_user_id } }
    assert_redirected_to date_schedule_url(@date_schedule)
  end

  test "should destroy date_schedule" do
    assert_difference('DateSchedule.count', -1) do
      delete date_schedule_url(@date_schedule)
    end

    assert_redirected_to date_schedules_url
  end
end
