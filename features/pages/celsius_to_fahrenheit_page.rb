require 'selenium-webdriver'
require_relative 'base_page'

class CelsiusToFahrenheitPage < BasePage

  def initialize(driver)
    super(driver)
    @url = '?action=form6'
  end

  def provide_celsius(celsius_degrees)
    element = find_element_safe(:name, 'celsius')
    element.clear
    element.send_keys celsius_degrees
  end

  def click_convert
    click_element(:id, 'btnCelsius')
  end

  def read_fahrenheit_field
    element = find_element_safe(:name, 'fahrenheit')
    element.attribute('value')
  end

end