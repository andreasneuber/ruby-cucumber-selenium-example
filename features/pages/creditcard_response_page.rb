require 'selenium-webdriver'

class CreditCardResponsePage

  def initialize(driver)
    @driver = driver
    @url = '?action=responsecc'
  end

  def visit
    @driver.navigate.to BASE_URL + @url
  end

  def is_alert_message_box_displayed
    wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds
    wait.until { @driver.find_element(xpath: "//div[contains(@class, 'alert')]") }
  end

  def grab_response_from_alert_box
    element = @driver.find_element(class_name: 'response').text
  end

  def grab_more_info_from_alert_box
    element = @driver.find_element(class_name: 'more-info').text
  end

end