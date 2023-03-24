require 'selenium-webdriver'

class SalesPage

  def initialize(driver)
    @driver = driver
    @url = '?action=sales'
  end

  def visit
    @driver.navigate.to BASE_URL + @url
  end

  def sales_stats_page_is_displayed
    wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds
    wait.until { @driver.find_element(xpath: "//h2[contains(text(),'Sales - Statistics')]") }
  end

  def grab_year_month_header
    element = @driver.find_element(css: '.sales.header-year-month').text
  end

  def month_cell_is_displayed(month)
    complete_xpath = sprintf("//td[contains(text(), '%s')]", month)
    wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds
    wait.until { @driver.find_element(xpath: complete_xpath) }
  end

  def grab_sales_amount_from_month(month)
    complete_xpath = sprintf("//td[contains(text(), '%s')]/following-sibling::td", month)
    sales_amount = @driver.find_element(xpath: complete_xpath).text
  end

end