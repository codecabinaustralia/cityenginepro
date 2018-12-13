require 'test_helper'

class AnalyseControllerTest < ActionDispatch::IntegrationTest
  test "should get days_from_level_achieved" do
    get analyse_days_from_level_achieved_url
    assert_response :success
  end

  test "should get days_between_level_achievements" do
    get analyse_days_between_level_achievements_url
    assert_response :success
  end

  test "should get attendence_from_skill_achieved" do
    get analyse_attendence_from_skill_achieved_url
    assert_response :success
  end

  test "should get attendence_between_skill_achievements" do
    get analyse_attendence_between_skill_achievements_url
    assert_response :success
  end

  test "should get attendence_from_level_achieved" do
    get analyse_attendence_from_level_achieved_url
    assert_response :success
  end

  test "should get attendence_between_level_achievements" do
    get analyse_attendence_between_level_achievements_url
    assert_response :success
  end

  test "should get age_when_skill_achieved" do
    get analyse_age_when_skill_achieved_url
    assert_response :success
  end

  test "should get age_when_level_achieved" do
    get analyse_age_when_level_achieved_url
    assert_response :success
  end

  test "should get people_site_location" do
    get analyse_people_site_location_url
    assert_response :success
  end

  test "should get people_determine_age" do
    get analyse_people_determine_age_url
    assert_response :success
  end

  test "should get identify_teachers" do
    get analyse_identify_teachers_url
    assert_response :success
  end

  test "should get average_lessons_attended_weekly" do
    get analyse_average_lessons_attended_weekly_url
    assert_response :success
  end

  test "should get identify_current_student_level" do
    get analyse_identify_current_student_level_url
    assert_response :success
  end

end
