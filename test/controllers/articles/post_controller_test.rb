require 'test_helper'

class Articles::PostControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get articles_post_new_url
    assert_response :success
  end

end
