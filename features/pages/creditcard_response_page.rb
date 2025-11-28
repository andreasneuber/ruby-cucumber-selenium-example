require 'selenium-webdriver'
require_relative 'base_page'

class CreditCardResponsePage < BasePage

  def initialize(driver)
    super(driver)
    @url = '?action=responsecc'
  end

  def is_alert_message_box_displayed
    wait_for_element(:xpath, "//div[contains(@class, 'alert')]")
  end

  def grab_response_from_alert_box
    get_text(:class_name, 'response')
  end

  def grab_more_info_from_alert_box
    get_text(:class_name, 'more-info')
  end

end