require 'selenium-webdriver'

class CelsiusToFahrenheitPage

  def initialize(driver)
    @driver = driver
    @url = '?action=form6'
  end

  def visit
    @driver.navigate.to BASE_URL + @url
  end

  def provide_celsius(celsius_degrees)
    element = @driver.find_element(name: 'celsius')
    element.clear
    element.send_keys celsius_degrees
  end

  def click_convert
    @driver.find_element(id: 'btnCelsius').click
  end

  def read_fahrenheit_field
    fahrenheit = @driver.find_element(:name, 'fahrenheit').attribute('value')
  end

end