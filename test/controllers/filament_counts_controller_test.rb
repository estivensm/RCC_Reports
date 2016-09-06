require 'test_helper'

class FilamentCountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @filament_count = filament_counts(:one)
  end

  test "should get index" do
    get filament_counts_url
    assert_response :success
  end

  test "should get new" do
    get new_filament_count_url
    assert_response :success
  end

  test "should create filament_count" do
    assert_difference('FilamentCount.count') do
      post filament_counts_url, params: { filament_count: { name: @filament_count.name } }
    end

    assert_redirected_to filament_count_url(FilamentCount.last)
  end

  test "should show filament_count" do
    get filament_count_url(@filament_count)
    assert_response :success
  end

  test "should get edit" do
    get edit_filament_count_url(@filament_count)
    assert_response :success
  end

  test "should update filament_count" do
    patch filament_count_url(@filament_count), params: { filament_count: { name: @filament_count.name } }
    assert_redirected_to filament_count_url(@filament_count)
  end

  test "should destroy filament_count" do
    assert_difference('FilamentCount.count', -1) do
      delete filament_count_url(@filament_count)
    end

    assert_redirected_to filament_counts_url
  end
end
