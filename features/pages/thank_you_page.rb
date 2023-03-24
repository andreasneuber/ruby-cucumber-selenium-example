require 'selenium-webdriver'

class ThankYouPage

  def initialize(driver)
    @driver = driver
    @url = '?action=thankYou'
  end

  def visit
    @driver.navigate.to BASE_URL + @url
  end

  def grab_thank_you_message
    message = @driver.find_element(tag_name: 'h2').text
  end

end