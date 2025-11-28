require 'selenium-webdriver'
require_relative 'base_page'

class CreditCardEntryPage < BasePage

  def initialize(driver)
    super(driver)
    @url = '?action=form3'
  end

  def enter_card_information(card_name, cc_number, expiry_date, cvv)
    type_into(:id, 'cname', card_name)
    type_into(:id, 'ccnum', cc_number)
    type_into(:id, 'expdate', expiry_date)
    type_into(:id, 'cvv', cvv)
  end

  def submit_payment
    click_element(:name, 'paynow')
  end

end