require 'test_helper'

class ResourcesEditTest < ActionDispatch::IntegrationTest
  def setup
    @resource = resources(:room1)
    @user = users(:alfred)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_resource_path(@resource)
    assert_template 'resources/edit'
    patch resource_path(@resource), params: { resource: { title:  "",
                                                          description: "",
                                                          hourly_rate: ""} }

    assert_template 'resources/edit'
  end

  test "successful edit" do
    log_in_as(@user)
    get edit_resource_path(@resource)
    assert_template 'resources/edit'
    title  = "Room 5"
    description = "Room description test"
    hourly_rate = 10
    patch resource_path(@resource), params: { resource: { title:  title,
                                                          description: description,
                                                          hourly_rate: hourly_rate} }
    assert_not flash.empty?
    assert_redirected_to @resource
    @resource.reload
    assert_equal title,  @resource.title
    assert_equal description, @resource.description
    assert_equal hourly_rate, @resource.hourly_rate
  end
end
