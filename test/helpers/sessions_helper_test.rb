require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @user = users(:alfred)
    remember(@user)
  end

  test "current_user returns right user" do
    assert_equal @user, current_user
    assert is_logged_in?
  end

  test "current_user returns nil" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end
end