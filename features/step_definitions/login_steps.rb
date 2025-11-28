require 'test/unit'
include Test::Unit::Assertions

And(/^I enter following for login$/) do |table|
  credentials = table.hashes

  @login_page.login(credentials[0]['username'], credentials[0]['password'])
end

When('I click login button') do
  @login_page.click_login
end

And(/^I enter following values to login$/) do |table|
  credentials = table.rows_hash

  @login_page.provide_username(credentials['username'])
  @login_page.provide_password(credentials['password'])
end

Then('I should be able to access the protected area') do
  @user_account_page.admin_dashboard_is_displayed
end