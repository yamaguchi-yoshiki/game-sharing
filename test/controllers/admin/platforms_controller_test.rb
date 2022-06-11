require "test_helper"

class Admin::PlatformsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_platforms_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_platforms_edit_url
    assert_response :success
  end
end
