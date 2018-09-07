require 'test_helper'

class ResourcesIndexTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:alfred)
    @non_admin = users(:mary)
    @resource = resources(:room1)
  end

  test "resource index with pagination when logged in as admin" do
    log_in_as(@admin)
    get resources_path
    assert_template 'resources/index'
    assert_select 'div.pagination'
    first_page_of_resources = Resource.paginate(page: 1)
    first_page_of_resources.each do |resource|
      assert_select 'a[href=?]', resource_path(resource), text: 'View'
      assert_select 'a[href=?]', edit_resource_path(resource), text: 'Edit'
      assert_select 'a[href=?]', resource_path(resource), text: 'Delete'
    end
  end

  test "should redirect when not logged in as admin" do
    log_in_as(@non_admin)
    get resources_path
    assert_redirected_to root_url
  end

  test "should redirect when not logged in" do
    get resources_path
    assert_redirected_to root_url
  end
end
