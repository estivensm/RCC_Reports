require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @report = reports(:one)
  end

  test "should get index" do
    get reports_url
    assert_response :success
  end

  test "should get new" do
    get new_report_url
    assert_response :success
  end

  test "should create report" do
    assert_difference('Report.count') do
      post reports_url, params: { report: { action_plan: @report.action_plan, autor: @report.autor, claim_potential: @report.claim_potential, claim_value: @report.claim_value, close_claim: @report.close_claim, code: @report.code, conclusions_plant: @report.conclusions_plant, count: @report.count, customer_end_use: @report.customer_end_use, customer_id: @report.customer_id, customer_report_date: @report.customer_report_date, date_close: @report.date_close, decitex: @report.decitex, denier: @report.denier, description_problem: @report.description_problem, email: @report.email, filament_count_id: @report.filament_count_id, invoice_invista: @report.invoice_invista, invoice_mag: @report.invoice_mag, merge_id: @report.merge_id, phone: @report.phone, plant_id: @report.plant_id, preliminary_conclusions: @report.preliminary_conclusions, preliminary_investigation: @report.preliminary_investigation, product_name: @report.product_name, quantity_affected: @report.quantity_affected, quantity_shipped: @report.quantity_shipped, report_start_date: @report.report_start_date, reporter: @report.reporter, research_results: @report.research_results, return_potential: @report.return_potential, return_value: @report.return_value, segment: @report.segment, source: @report.source, specific_problem_id: @report.specific_problem_id, title: @report.title, validation_claim: @report.validation_claim, value: @report.value, yarn_type_id: @report.yarn_type_id } }
    end

    assert_redirected_to report_url(Report.last)
  end

  test "should show report" do
    get report_url(@report)
    assert_response :success
  end

  test "should get edit" do
    get edit_report_url(@report)
    assert_response :success
  end

  test "should update report" do
    patch report_url(@report), params: { report: { action_plan: @report.action_plan, autor: @report.autor, claim_potential: @report.claim_potential, claim_value: @report.claim_value, close_claim: @report.close_claim, code: @report.code, conclusions_plant: @report.conclusions_plant, count: @report.count, customer_end_use: @report.customer_end_use, customer_id: @report.customer_id, customer_report_date: @report.customer_report_date, date_close: @report.date_close, decitex: @report.decitex, denier: @report.denier, description_problem: @report.description_problem, email: @report.email, filament_count_id: @report.filament_count_id, invoice_invista: @report.invoice_invista, invoice_mag: @report.invoice_mag, merge_id: @report.merge_id, phone: @report.phone, plant_id: @report.plant_id, preliminary_conclusions: @report.preliminary_conclusions, preliminary_investigation: @report.preliminary_investigation, product_name: @report.product_name, quantity_affected: @report.quantity_affected, quantity_shipped: @report.quantity_shipped, report_start_date: @report.report_start_date, reporter: @report.reporter, research_results: @report.research_results, return_potential: @report.return_potential, return_value: @report.return_value, segment: @report.segment, source: @report.source, specific_problem_id: @report.specific_problem_id, title: @report.title, validation_claim: @report.validation_claim, value: @report.value, yarn_type_id: @report.yarn_type_id } }
    assert_redirected_to report_url(@report)
  end

  test "should destroy report" do
    assert_difference('Report.count', -1) do
      delete report_url(@report)
    end

    assert_redirected_to reports_url
  end
end
