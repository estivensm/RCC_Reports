require 'test_helper'

class SpecificProblemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @specific_problem = specific_problems(:one)
  end

  test "should get index" do
    get specific_problems_url
    assert_response :success
  end

  test "should get new" do
    get new_specific_problem_url
    assert_response :success
  end

  test "should create specific_problem" do
    assert_difference('SpecificProblem.count') do
      post specific_problems_url, params: { specific_problem: { name: @specific_problem.name } }
    end

    assert_redirected_to specific_problem_url(SpecificProblem.last)
  end

  test "should show specific_problem" do
    get specific_problem_url(@specific_problem)
    assert_response :success
  end

  test "should get edit" do
    get edit_specific_problem_url(@specific_problem)
    assert_response :success
  end

  test "should update specific_problem" do
    patch specific_problem_url(@specific_problem), params: { specific_problem: { name: @specific_problem.name } }
    assert_redirected_to specific_problem_url(@specific_problem)
  end

  test "should destroy specific_problem" do
    assert_difference('SpecificProblem.count', -1) do
      delete specific_problem_url(@specific_problem)
    end

    assert_redirected_to specific_problems_url
  end
end
