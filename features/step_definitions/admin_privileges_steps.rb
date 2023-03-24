require 'test/unit'
include Test::Unit::Assertions

Given('I navigate to login page') do
  login_page = LoginPage.new DRIVER
  login_page.visit
end

When(/^I submit username "([^"]*)" and password "([^"]*)"$/) do |username, pw|
  login_page = LoginPage.new DRIVER
  login_page.provide_username username
  login_page.provide_password pw
  login_page.click_login
end

Then('I will be logged into the Admin Dashboard') do
  user_account_page = UserAccountPage.new DRIVER
  user_account_page.admin_dashboard_is_displayed
end

When(/^Admin searches for employee "([^"]*)"$/) do |employee_name|
  user_account_page = UserAccountPage.new DRIVER
  user_account_page.navigate_to_hr_section

  employee_page = EmployeePage.new DRIVER
  employee_page.employee_page_is_displayed
  employee_page.fill_employee_name_input employee_name
  employee_page.click_search_btn
end

Then(/^information appears that employee "([^"]*)" belongs to department "([^"]*)"$/) do |expected_employee_name, expected_department_name|

  employee_page = EmployeePage.new DRIVER
  employee_page.employee_record_is_displayed

  actual_employee_name = employee_page.grab_employee_name
  assert_equal( expected_employee_name, actual_employee_name, "Expected employee name not found" )

  actual_department_name = employee_page.grab_department_name
  assert_equal( expected_department_name, actual_department_name, "Expected department name not found" )
end

When(/^Admin looks up total sales amount for month "([^"]*)" in year "([^"]*)"$/) do |month, year|
  user_account_page = UserAccountPage.new DRIVER
  user_account_page.navigate_to_sales_section

  sales_page = SalesPage.new DRIVER
  sales_page.sales_stats_page_is_displayed

  year_month_header = sales_page.grab_year_month_header
  assert_true((year_month_header.include? year), "Year " + year + " was not found.")

  sales_page.month_cell_is_displayed(month)
end

Then(/^the total "([^"]*)" sales amount is "([^"]*)"$/) do |month, expectedSalesAmount|
  sales_page = SalesPage.new DRIVER
  actual_sales_amount = sales_page.grab_sales_amount_from_month(month)
  assert_equal( expectedSalesAmount, actual_sales_amount,
                                                  "Expected sales amount to be '#{expectedSalesAmount}'
                                                            but '#{actual_sales_amount}' was displayed." )
end