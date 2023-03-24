require 'test/unit'
include Test::Unit::Assertions

Given('I navigate to Information about yourself page') do
  provide_your_details_page = ProvideYourDetailsPage.new DRIVER
  provide_your_details_page.visit
end

When(/^I provide the following details$/) do |table|
  details = table.rows_hash

  provide_your_details_page = ProvideYourDetailsPage.new DRIVER
  provide_your_details_page.provide_first_name(details['firstname'])
  provide_your_details_page.provide_last_name(details['lastname'])
  provide_your_details_page.provide_street(details['street'])
  provide_your_details_page.provide_city(details['city'])
  provide_your_details_page.provide_zip(details['zip'])
  provide_your_details_page.provide_state(details['state'])
  provide_your_details_page.provide_country(details['country'])
  provide_your_details_page.provide_mobile_phone_number(details['mobile phone'])
  provide_your_details_page.provide_home_phone_number(details['home phone'])
  provide_your_details_page.provide_email(details['email'])

  provide_your_details_page.click_submit_your_information
end

Then(/^I will see message "([^"]*)"$/) do |expected_message|
  thank_you_page = ThankYouPage.new DRIVER
  actual_message = thank_you_page.grab_thank_you_message
  assert_equal(expected_message, actual_message, "Thank you message is not correct")
end