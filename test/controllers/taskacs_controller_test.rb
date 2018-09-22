require 'test_helper'

class TaskacsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get taskacs_create_url
    assert_response :success
  end

  test "should get destroy" do
    get taskacs_destroy_url
    assert_response :success
  end

end
