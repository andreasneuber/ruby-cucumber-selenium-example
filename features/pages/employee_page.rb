require 'selenium-webdriver'
require_relative 'base_page'

class EmployeePage < BasePage

  def initialize(driver)
    super(driver)
    @url = '?action=employee'
  end

  def employee_page_is_displayed
    wait_for_element(:xpath, "//h2[contains(text(),'Human Resources - Find employee')]")
  end

  def fill_employee_name_input(employee_name)
    type_into(:id, 'employee-name', employee_name)
  end

  def click_search_btn
    click_element(:id, 'btnSearch')
  end

  def employee_record_is_displayed
    wait_for_element(:id, 'employee-details')
  end

  def grab_employee_name
    get_text(:css, '.employee.name')
  end

  def grab_department_name
    get_text(:css, '.employee.department')
  end

end