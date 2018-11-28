require 'test_helper'

class DataSourceControllerTest < ActionDispatch::IntegrationTest
  test "should get locations" do
    get data_source_locations_url
    assert_response :success
  end

end
