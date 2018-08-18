require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,            "MSTC"
    assert_equal full_title("Help"),    "Help | MSTC"
    assert_equal full_title("About"),   "About | MSTC"
    assert_equal full_title("Contact"), "Contact | MSTC"
  end
end
