require 'selenium-webdriver'
require_relative 'base_page'

class LoginPage < BasePage

  def initialize(driver)
    super(driver)
    @url = '?action=form4'
  end

  def provide_username(user_name)
    wait_for_element(:name, 'user')
    type_into(:name, 'user', user_name)
  end

  def provide_password(password)
    type_into(:name, 'pw', password)
  end

  def login(user_name, password)
    provide_username(user_name)
    provide_password(password)
  end

  def click_login
    click_element(:name, 'Login')
  end

end