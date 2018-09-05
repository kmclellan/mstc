# frozen_string_literal: true

require 'test_helper'

class LayoutTest < ActionDispatch::IntegrationTest
  test 'layout links' do
    get root_path
    assert_select 'title'
    assert_template 'pages/home'
    assert_select 'a[href=?]', root_path
    assert_select 'a[href=?]', help_path
    assert_select 'a[href=?]', about_path
    assert_select 'a[href=?]', contact_path
    get home_path
    assert_select 'title'
    get help_path
    assert_select 'title', full_title('Help')
    get about_path
    assert_select 'title', full_title('About')
    get contact_path
    assert_select 'title', full_title('Contact')
  end
end
