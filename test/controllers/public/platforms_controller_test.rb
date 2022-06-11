require "test_helper"

class Public::PlatformsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_platforms_show_url
    assert_response :success
  end
end
