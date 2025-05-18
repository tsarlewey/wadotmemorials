require "test_helper"

class MapEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get map_entries_new_url
    assert_response :success
  end

  test "should get create" do
    get map_entries_create_url
    assert_response :success
  end

  test "should get index" do
    get map_entries_index_url
    assert_response :success
  end
end
