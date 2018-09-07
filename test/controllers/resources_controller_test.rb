require 'test_helper'

class ResourcesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:alfred)
    @other_user = users(:mary)
  end

  test "should get new" do
    log_in_as(@user)
    get resources_new_path
    assert_response :success
  end

  test "should redirect resource creation when not logged in as admin" do
    log_in_as(@other_user)
    get resources_new_path
    assert_redirected_to root_url
  end

  test "should redirect resource creation when not logged in" do
    get resources_new_path
    assert_redirected_to root_url
  end

  test "should redirect resources list when not logged in" do
    get resources_path
    assert_redirected_to root_url
  end


end
