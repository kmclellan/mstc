# frozen_string_literal: true

require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:alfred)
  end

  test 'unsuccessful edit' do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { firstname:  '',
                                              lastname: '',
                                              email: 'test@invalid',
                                              password:              'test1',
                                              password_confirmation: 'test2' } }
    assert_template 'users/edit'
  end

  test 'successful edit with friendly forwarding' do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    firstname = 'John'
    lastname = 'Doe'
    email = 'john.doe@email.com'
    patch user_path(@user), params: { user: { firstname:  firstname,
                                              lastname: lastname,
                                              email: email,
                                              password:              '',
                                              password_confirmation: '' } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal firstname, @user.firstname
    assert_equal lastname, @user.lastname
    assert_equal email, @user.email
  end
end
