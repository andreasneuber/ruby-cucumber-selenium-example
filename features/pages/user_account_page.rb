require 'selenium-webdriver'
require_relative 'base_page'

class UserAccountPage < BasePage

  def initialize(driver)
    super(driver)
    @url = '?action=useraccount'
  end

  def admin_dashboard_is_displayed
    wait_for_element(:xpath, "//h2[contains(text(),'Admin Dashboard')]")
  end

  def navigate_to_hr_section
    click_element(:id, "hr-resources-link")
  end

  def navigate_to_sales_section
    click_element(:id, "sales-statistics-link")
  end

end