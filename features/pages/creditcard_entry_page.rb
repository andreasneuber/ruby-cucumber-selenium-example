require 'selenium-webdriver'

class CreditCardEntryPage

  def initialize(driver)
    @driver = driver
    @url = '?action=form3'
  end

  def visit
    @driver.navigate.to BASE_URL + @url
  end

  def enter_card_information(card_name, cc_number, expiry_date, cvv)
    element = @driver.find_element(id: 'cname')
    element.send_keys card_name

    element = @driver.find_element(id: 'ccnum')
    element.send_keys cc_number

    element = @driver.find_element(id: 'expdate')
    element.send_keys expiry_date

    element = @driver.find_element(id: 'cvv')
    element.send_keys cvv
  end

  def submit_payment
    @driver.find_element(name: 'paynow').click
  end

end