require 'test_helper'

class YarnTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @yarn_type = yarn_types(:one)
  end

  test "should get index" do
    get yarn_types_url
    assert_response :success
  end

  test "should get new" do
    get new_yarn_type_url
    assert_response :success
  end

  test "should create yarn_type" do
    assert_difference('YarnType.count') do
      post yarn_types_url, params: { yarn_type: { name: @yarn_type.name } }
    end

    assert_redirected_to yarn_type_url(YarnType.last)
  end

  test "should show yarn_type" do
    get yarn_type_url(@yarn_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_yarn_type_url(@yarn_type)
    assert_response :success
  end

  test "should update yarn_type" do
    patch yarn_type_url(@yarn_type), params: { yarn_type: { name: @yarn_type.name } }
    assert_redirected_to yarn_type_url(@yarn_type)
  end

  test "should destroy yarn_type" do
    assert_difference('YarnType.count', -1) do
      delete yarn_type_url(@yarn_type)
    end

    assert_redirected_to yarn_types_url
  end
end
