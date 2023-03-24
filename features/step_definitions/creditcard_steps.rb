require 'test/unit'
include Test::Unit::Assertions

Given('User is on card card entry page') do
  credit_card_entry_page = CreditCardEntryPage.new DRIVER
  credit_card_entry_page.visit
end

When(/^User (.*) enters card number (.*) together with expiry date (.*) and cvv (.*)$/) do |name, cc_number, expiry_date, cvv|
  credit_card_entry_page = CreditCardEntryPage.new DRIVER
  credit_card_entry_page.enter_card_information(name, cc_number, expiry_date, cvv)
  credit_card_entry_page.submit_payment
end

Then(/^the page will respond with (.*) and provide as reason (.*)$/) do |expected_response, expected_reason|
  credit_card_response_page = CreditCardResponsePage.new DRIVER

  credit_card_response_page.is_alert_message_box_displayed

  actual_response = credit_card_response_page.grab_response_from_alert_box
  assert_true((actual_response.include? expected_response), "Unexpected response text")

  actual_reason = credit_card_response_page.grab_more_info_from_alert_box
  assert_true((actual_reason.include? expected_reason), "Unexpected reason text")
end