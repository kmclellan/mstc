require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :title => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :mobile => "MyString",
      :admin => false,
      :password_hash => "MyString",
      :password_salt => "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_title[name=?]", "user[title]"

      assert_select "input#user_first_name[name=?]", "user[first_name]"

      assert_select "input#user_last_name[name=?]", "user[last_name]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_phone[name=?]", "user[phone]"

      assert_select "input#user_mobile[name=?]", "user[mobile]"

      assert_select "input#user_admin[name=?]", "user[admin]"

      assert_select "input#user_password_hash[name=?]", "user[password_hash]"

      assert_select "input#user_password_salt[name=?]", "user[password_salt]"
    end
  end
end
