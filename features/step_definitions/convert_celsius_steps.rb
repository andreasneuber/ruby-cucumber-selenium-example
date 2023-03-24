require 'test/unit'
include Test::Unit::Assertions

Given(/^I provide "([^"]*)" degree Celsius$/) do |celsius|
  celsius_to_fahrenheit_page = CelsiusToFahrenheitPage.new DRIVER
  celsius_to_fahrenheit_page.visit
  celsius_to_fahrenheit_page.provide_celsius(celsius)
end

When('I click the convert button') do
  celsius_to_fahrenheit_page = CelsiusToFahrenheitPage.new DRIVER
  celsius_to_fahrenheit_page.click_convert
end

Then(/^I should see as result "([^"]*)" Fahrenheit$/) do |expected_fahrenheit|
  celsius_to_fahrenheit_page = CelsiusToFahrenheitPage.new DRIVER
  actual_fahrenheit = celsius_to_fahrenheit_page.read_fahrenheit_field
  assert_equal(expected_fahrenheit, actual_fahrenheit, "Fahrenheit amount is incorrect")
end