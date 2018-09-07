# frozen_string_literal: true

require 'test_helper'

class UsersNewTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
  end

  test 'invalid new user information' do
    get users_new_path
    #  assert_select 'form[action="/users/new"]'
    assert_no_difference 'User.count' do
      post users_path, params: { user: { firstname:  '',
                                         lastname: '',
                                         email: 'user@test',
                                         password:              'test1',
                                         password_confirmation: 'test2' } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test 'valid signup information with account activation' do
    get users_new_path
    #  assert_select 'form[action="/users/new"]'
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { firstname:  'John',
                                         lastname: 'Doe',
                                         email: 'john.doe@email.com',
                                         password:              '12345678',
                                         password_confirmation: '12345678' } }
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_not user.activated?
    log_in_as(user)
    assert_not logged_in?
    get edit_user_activation_path('invalid token', email: user.email)
    assert_not logged_in?
    get edit_user_activation_path(user.activation_token, email: 'wrong')
    assert_not logged_in?
    get edit_user_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
    assert logged_in?
  end
end
