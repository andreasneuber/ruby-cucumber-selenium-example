require 'selenium-webdriver'

class BasePage
  DEFAULT_TIMEOUT = 10

  def initialize(driver)
    @driver = driver
  end

  def visit
    @driver.navigate.to BASE_URL + @url if @url
  end

  # Wait for element and return it
  def wait_for_element(locator_type, locator_value, timeout: DEFAULT_TIMEOUT)
    wait = Selenium::WebDriver::Wait.new(timeout: timeout)
    wait.until { @driver.find_element(locator_type, locator_value) }
  end

  # Find element with implicit wait handling
  def find_element_safe(locator_type, locator_value)
    @driver.find_element(locator_type, locator_value)
  end

  # Check if element is displayed
  def element_displayed?(locator_type, locator_value, timeout: DEFAULT_TIMEOUT)
    wait_for_element(locator_type, locator_value, timeout: timeout)
    true
  rescue Selenium::WebDriver::Error::TimeoutError
    false
  end

  # Type text into element
  def type_into(locator_type, locator_value, text)
    element = find_element_safe(locator_type, locator_value)
    element.send_keys text
  end

  # Click element
  def click_element(locator_type, locator_value)
    element = find_element_safe(locator_type, locator_value)
    element.click
  end

  # Get text from element
  def get_text(locator_type, locator_value)
    element = find_element_safe(locator_type, locator_value)
    element.text
  end
end
