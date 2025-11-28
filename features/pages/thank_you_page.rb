require 'selenium-webdriver'
require_relative 'base_page'

class ThankYouPage < BasePage

  def initialize(driver)
    super(driver)
    @url = '?action=thankYou'
  end

  def grab_thank_you_message
    get_text(:tag_name, 'h2')
  end

end