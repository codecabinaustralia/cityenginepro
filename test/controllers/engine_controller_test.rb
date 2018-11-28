require 'test_helper'

class EngineControllerTest < ActionDispatch::IntegrationTest
  test "should get location" do
    get engine_location_url
    assert_response :success
  end

  test "should get levels" do
    get engine_levels_url
    assert_response :success
  end

  test "should get skills" do
    get engine_skills_url
    assert_response :success
  end

  test "should get people" do
    get engine_people_url
    assert_response :success
  end

  test "should get classes" do
    get engine_classes_url
    assert_response :success
  end

  test "should get student_levels" do
    get engine_student_levels_url
    assert_response :success
  end

  test "should get student_skills" do
    get engine_student_skills_url
    assert_response :success
  end

  test "should get lesson_bookings" do
    get engine_lesson_bookings_url
    assert_response :success
  end

end
