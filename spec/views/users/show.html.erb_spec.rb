require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :title => "Title",
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :phone => "Phone",
      :mobile => "Mobile",
      :admin => false,
      :password_hash => "Password Hash",
      :password_salt => "Password Salt"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Mobile/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Password Hash/)
    expect(rendered).to match(/Password Salt/)
  end
end
