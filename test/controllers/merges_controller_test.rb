require 'test_helper'

class MergesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @merge = merges(:one)
  end

  test "should get index" do
    get merges_url
    assert_response :success
  end

  test "should get new" do
    get new_merge_url
    assert_response :success
  end

  test "should create merge" do
    assert_difference('Merge.count') do
      post merges_url, params: { merge: { name: @merge.name } }
    end

    assert_redirected_to merge_url(Merge.last)
  end

  test "should show merge" do
    get merge_url(@merge)
    assert_response :success
  end

  test "should get edit" do
    get edit_merge_url(@merge)
    assert_response :success
  end

  test "should update merge" do
    patch merge_url(@merge), params: { merge: { name: @merge.name } }
    assert_redirected_to merge_url(@merge)
  end

  test "should destroy merge" do
    assert_difference('Merge.count', -1) do
      delete merge_url(@merge)
    end

    assert_redirected_to merges_url
  end
end
