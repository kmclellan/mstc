require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :title => "Title",
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :phone => "Phone",
        :mobile => "Mobile",
        :admin => false,
        :password_hash => "Password Hash",
        :password_salt => "Password Salt"
      ),
      User.create!(
        :title => "Title",
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :phone => "Phone",
        :mobile => "Mobile",
        :admin => false,
        :password_hash => "Password Hash",
        :password_salt => "Password Salt"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Password Hash".to_s, :count => 2
    assert_select "tr>td", :text => "Password Salt".to_s, :count => 2
  end
end
