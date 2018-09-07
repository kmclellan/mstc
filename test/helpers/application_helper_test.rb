# frozen_string_literal: true

require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'full title helper' do
    assert_equal full_title,            'MSTC'
    assert_equal full_title('Help'),    'Help | MSTC'
    assert_equal full_title('About'),   'About | MSTC'
    assert_equal full_title('Contact'), 'Contact | MSTC'
    assert_equal full_title('User Creation'), 'User Creation | MSTC'
    assert_equal full_title('User Information'), 'User Information | MSTC'
    assert_equal full_title('User Edit'), 'User Edit | MSTC'
    assert_equal full_title('User List'), 'User List | MSTC'
    assert_equal full_title('User Login'), 'User Login | MSTC'
  end
end
