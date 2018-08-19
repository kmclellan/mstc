require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(firstname: "John", lastname: "Doe", email: "john.doe@email.com",
        password: "12345678", password_confirmation: "12345678")

  end

  test "should be valid" do
    assert @user.valid?
    end

  test "first name should be present" do
    @user.firstname = "     "
    assert_not @user.valid?
  end

  test "last name should be present" do
    @user.lastname = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "first name should not be long" do
    @user.firstname = "a" * 26
    assert_not @user.valid?
  end

  test "last name should not be long" do
    @user.lastname = "a" * 26
    assert_not @user.valid?
  end

  test "email should not be long" do
    @user.email = "a" * 191 + "@email.com"
    assert_not @user.valid?
  end

  test "email should be valid" do
    valid_addresses = %w[user@email.com USER@test.COM A_US-ER@mail.test.org
                         first.last@foo.to first+last@baz.co.uk]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email should not be invalid" do
    invalid_addresses = %w[user@email,com user_at_test.COM user.name@mail.
                         firstlast@foo_bar.to firstlast@baz+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should lowercase" do
    mixedcase_email = "JohnDoe@EmAIl.CoM"
    @user.email = mixedcase_email
    @user.save
    assert_equal mixedcase_email.downcase, @user.reload.email
  end

  test "password should not be blank" do
    @user.password = @user.password_confirmation = " " * 8
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 7
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end

end
