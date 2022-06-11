require "test_helper"

class Public::ThreadMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_thread_messages_index_url
    assert_response :success
  end
end
