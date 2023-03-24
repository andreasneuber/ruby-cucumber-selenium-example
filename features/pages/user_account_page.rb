require 'selenium-webdriver'

class UserAccountPage

  def initialize(driver)
    @driver = driver
    @url = '?action=useraccount'
  end

  def visit
    @driver.navigate.to BASE_URL + @url
  end

  def admin_dashboard_is_displayed
    wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds
    wait.until { @driver.find_element(xpath: "//h2[contains(text(),'Admin Dashboard')]") }
  end

  def navigate_to_hr_section
    element = @driver.find_element(id: "hr-resources-link")
    element.click
  end

  def navigate_to_sales_section
    element = @driver.find_element(id: "sales-statistics-link")
    element.click
  end

end