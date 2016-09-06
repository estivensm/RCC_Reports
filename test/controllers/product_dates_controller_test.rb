require 'test_helper'

class ProductDatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_date = product_dates(:one)
  end

  test "should get index" do
    get product_dates_url
    assert_response :success
  end

  test "should get new" do
    get new_product_date_url
    assert_response :success
  end

  test "should create product_date" do
    assert_difference('ProductDate.count') do
      post product_dates_url, params: { product_date: { date: @product_date.date, number: @product_date.number, report_id: @product_date.report_id } }
    end

    assert_redirected_to product_date_url(ProductDate.last)
  end

  test "should show product_date" do
    get product_date_url(@product_date)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_date_url(@product_date)
    assert_response :success
  end

  test "should update product_date" do
    patch product_date_url(@product_date), params: { product_date: { date: @product_date.date, number: @product_date.number, report_id: @product_date.report_id } }
    assert_redirected_to product_date_url(@product_date)
  end

  test "should destroy product_date" do
    assert_difference('ProductDate.count', -1) do
      delete product_date_url(@product_date)
    end

    assert_redirected_to product_dates_url
  end
end
