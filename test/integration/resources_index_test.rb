require 'test_helper'

class ResourcesIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:alfred)
    @resource = resources(:room1)
  end

  test "index including pagination" do
    log_in_as(@user)
    get resources_path
    assert_template 'resources/index'
    assert_select 'div.pagination'
    first_page_of_resources = Resource.paginate(page: 1)
    first_page_of_resources.each do |resource|
      assert_select 'a[href=?]', edit_resource_path(resource), text: 'Edit'
    end
  end
end
