require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
  def setup
    @resource = Resource.new(title: "Room 5", description: "Room dedicated for Oxygen sessions")
  end

  test "should be valid" do
    assert @resource.valid?
  end

  test "title should be present" do
    @resource.title = "     "
    assert_not @resource.valid?
  end

  test "description should be present" do
    @resource.description = "     "
    assert_not @resource.valid?
  end

  test "title should not be too long" do
    @resource.title = "a" * 26
    assert_not @resource.valid?
  end

  test "description should not be too long" do
    @resource.description = "a" * 251
    assert_not @resource.valid?
  end

  test "Resource title should be unique" do
    duplicate_resource = @resource.dup
    duplicate_resource.title = @resource.title.upcase
    @resource.save
    assert_not duplicate_resource.valid?
  end


end
