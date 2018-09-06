require 'test_helper'

class ResourcesCreationTest < ActionDispatch::IntegrationTest
  test "invalid resource creation information" do
    get resources_new_path
    assert_no_difference 'Resource.count' do
      post resources_path, params: { resource: { title:  "",
                                         description: ""} }
    end
    assert_template 'resources/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid resource creation information" do
    get resources_new_path
    assert_difference 'Resource.count', 1 do
      post resources_path, params: { resource: { title:  "Room 1",
                                                 description: "Room dedicated to Oxygen Sessions"} }
    end
    follow_redirect!
    assert_template 'resources/show'
    assert_not flash.empty?
  end
end
