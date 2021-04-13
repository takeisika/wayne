require 'test_helper'

class LikecommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get likecomments_create_url
    assert_response :success
  end

end
