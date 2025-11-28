require 'selenium-webdriver'
require_relative 'base_page'

class SalesPage < BasePage

  def initialize(driver)
    super(driver)
    @url = '?action=sales'
  end

  def sales_stats_page_is_displayed
    wait_for_element(:xpath, "//h2[contains(text(),'Sales - Statistics')]")
  end

  def grab_year_month_header
    get_text(:css, '.sales.header-year-month')
  end

  def month_cell_is_displayed(month)
    complete_xpath = sprintf("//td[contains(text(), '%s')]", month)
    wait_for_element(:xpath, complete_xpath)
  end

  def grab_sales_amount_from_month(month)
    complete_xpath = sprintf("//td[contains(text(), '%s')]/following-sibling::td", month)
    get_text(:xpath, complete_xpath)
  end

end