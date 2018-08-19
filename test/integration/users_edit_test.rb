require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:alfred)
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { firstname:  "",
                                              lastname: "",
                                              email: "test@invalid",
                                              password:              "test1",
                                              password_confirmation: "test2" } }
    assert_template 'users/edit'
  end

  test "successful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    firstname  = "John"
    lastname = "Doe"
    email = "john.doe@email.com"
    patch user_path(@user), params: { user: { firstname:  firstname,
                                              lastname: lastname,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal firstname,  @user.firstname
    assert_equal lastname, @user.lastname
    assert_equal email, @user.email
  end
end
