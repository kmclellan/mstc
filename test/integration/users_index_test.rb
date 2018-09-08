# frozen_string_literal: true

require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:alfred)
    @admin = Admin.where(user_id: @user.id).first
    @other_user = users(:mary)
    @non_admin = Admin.where(user_id: @other_user.id).first
  end

  test 'Users list including pagination' do
    log_in_as(@user)
    assert @admin
    get users_path
    assert_response :success
    assert_template 'users/index'
    assert_select 'div.pagination'
    first_page_of_users = User.paginate(page: 1)
    first_page_of_users.each do |user|
      assert_select 'a[href=?]', user_path(user), text: 'View'
      assert_select 'a[href=?]', edit_user_path(user), text: 'Edit'
      unless user == @user
        assert_select 'a[href=?]', user_path(user), text: 'Delete'
      end
    end
    assert_difference 'User.count', -1 do
      delete user_path(@other_user)
    end
  end

  test 'should redirect when not logged in as admin' do
    log_in_as(@other_user)
    assert_not @non_admin
    get users_path
    assert_redirected_to root_url
  end
end
