require 'test_helper'

class PublicPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get public_pages_home_url
    assert_response :success
  end

  test "should get help" do
    get public_pages_help_url
    assert_response :success
  end

end
