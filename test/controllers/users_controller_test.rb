require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:alfred)
    @other_user = users(:mary)
  end

  test "should get new" do
    get users_new_path
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { firstname: @user.firstname,
                                              lastname: @user.lastname,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch user_path(@user), params: { user: { firstname: @user.firstname,
                                              lastname: @user.lastname,
                                              email: @user.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end
end
