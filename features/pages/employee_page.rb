require 'selenium-webdriver'

class EmployeePage

  def initialize(driver)
    @driver = driver
    @url = '?action=employee'
  end

  def visit
    @driver.navigate.to BASE_URL + @url
  end

  def employee_page_is_displayed
    wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds
    wait.until { @driver.find_element(xpath: "//h2[contains(text(),'Human Resources - Find employee')]") }
  end

  def fill_employee_name_input(employee_name)
    element = @driver.find_element(id: 'employee-name')
    element.send_keys employee_name
  end

  def click_search_btn
    element = @driver.find_element(id: 'btnSearch')
    element.click
  end

  def employee_record_is_displayed
    wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds
    wait.until { @driver.find_element(id: 'employee-details') }
  end

  def grab_employee_name
    element = @driver.find_element(css: '.employee.name').text
  end

  def grab_department_name
    department_name = @driver.find_element(css: '.employee.department').text
  end

end